use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use sml;
use AI::MXNet qw(mx);

sub evaluate_algorithm_cross_validation_split {
    my ($self, $dataset, $algorithm, %args) = ((splice @_, 0, 3), n_folds => 10, metric => undef, @_);

    my @folds = @{ sml->cross_validation_split($dataset, n_folds => $args{n_folds}) };
    my ($actual, $predicted, $train_loss, $test_loss);
    my (@scores);
    my (@actuals_tensors, @predictions_tensors, @train_losses_values, @test_losses_values);

    while (my ($i, $fold) = each @folds) {
        my @train_set = @folds;
        splice @train_set, $i, 1;

        my $train_tensor = mx->nd->concat([map { mx->nd->array($_) } map { @$_ } @train_set], { dim => 0 });
        my $test_tensor  = mx->nd->concat([map { mx->nd->array($_) } @$fold], { dim => 0 });

        my $test_input;
        if (($test_tensor->shape->[1] // 0) > 1) {
            $test_input = $test_tensor->slice_axis(axis => 1, begin => 0, end => $test_tensor->shape->[1] - 1);
        } else {
            $test_input = $test_tensor;
        }

        ($predicted, $train_loss, $test_loss) = $algorithm->('sml', $train_tensor, $test_input, @_);

        $actual = $test_tensor->slice_axis(axis => 1, begin => $test_tensor->shape->[1] - 1, end => $test_tensor->shape->[1]);
        $actual = $actual->reshape([-1]);

        if ($predicted->shape->[0] && ($predicted->shape->[1] // 0) == 1) {
            $predicted = $predicted->reshape([-1]);
        }

        if (defined $args{metric}) {
            if ($args{metric} =~ /accuracy/i) {
                push @scores, sml->accuracy_metric($actual, $predicted);
            } elsif ($args{metric} =~ /rmse/i) {
                push @scores, sml->rmse_metric($actual, $predicted);
            }
        } else {
            my $as_array = $actual->reshape([-1])->aspdl->list;
            push @scores, (grep { /\d+\.\d+/ } @$as_array)
                          ? sml->rmse_metric($actual, $predicted)
                          : sml->accuracy_metric($actual, $predicted);
        }

        push @train_losses_values, $train_loss;
        push @test_losses_values, $test_loss;
        push @actuals_tensors, $actual;
        push @predictions_tensors, $predicted;
    }

    my $train_losses_tensor = mx->nd->array(\@train_losses_values);
    my $test_losses_tensor  = mx->nd->array(\@test_losses_values);
    my $actuals_tensor      = mx->nd->concat(\@actuals_tensors, { dim => 0 });
    my $predictions_tensor  = mx->nd->concat(\@predictions_tensors, { dim => 0 });

    return wantarray ? (\@scores, $train_losses_tensor, $test_losses_tensor, $actuals_tensor, $predictions_tensor) : \@scores;
}

sml->add_to_class('evaluate_algorithm_cross_validation_split', \&evaluate_algorithm_cross_validation_split);


mx->random->seed(1);
my $filename = '../data/pima-indians-diabetes.csv';
my $dataset = sml->load_csv($filename);
$dataset = mx->nd->array($dataset);
my $n_fold = 5;

my ($scores, $train_losses, $test_losses, $actuals, $predictions) = sml->evaluate_algorithm_cross_validation_split(
    $dataset,
    \&{'sml::zero_rule_algorithm_classification'},
    n_folds => $n_fold,
    metric  => 'accuracy'
);
