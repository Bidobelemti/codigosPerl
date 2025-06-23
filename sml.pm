# Load libraries
use strict;
use warnings;
use Data::Dump qw(dump);
use AI::MXNet qw(mx);
use List::Util qw(zip min max sum uniq all any shuffle);
use Tie::IxHash;
package sml {


    # Registra funciones como métodos en la clase
    sub add_to_class { #@save
        my ($class, $method_name, $code_ref) = @_;
        {
            no strict 'refs';  # Permite referencias simbólicas
            *{$class . '::' . $method_name} = $code_ref;  # Define el método dinámicamente
        }
    }
    1;
}
sub load_csv {
    my ($self, $file_path, %args) = @_;
    $args{delimiter} ||= '[,:\t]';  # Delimitador por defecto: coma, dos puntos o tab
    
    open(my $fh, '<', $file_path) or die "Cannot open file $file_path: $!";
    
    my $header = <$fh>;
    chomp($header);
    my @dataset;
    
    while (my $row = <$fh>) {
        chomp($row);
        $row =~ s/[\r\n]+$//g;  # Elimina retornos de carro y newlines
        next if $row =~ /^\s*$/;  # Salta líneas vacías
        
        push @dataset, [split /$args{delimiter}/, $row];
    }
    
    close $fh;
    return wantarray ? (\@dataset, $header) : \@dataset;
}
sml->add_to_class('load_csv', \&load_csv);
sub str_column_to_int {
    my ($self, $dataset, $column) = @_;
    
    # Get all values from the specified column
    my $class_values = [map { $_->[$column] } @$dataset];
    
    # Find unique values and create mapping
    my @unique = uniq @$class_values;
    my %lookup;
    
    # Create hash lookup (value => integer mapping)
    foreach my $i (0..$#unique) {
        $lookup{$unique[$i]} = $i;  # Fixed syntax: using {} instead of ()
    }
    
    # Convert all values in the column
    foreach my $row (@$dataset) {
        $row->[$column] = $lookup{$row->[$column]};  # Fixed syntax
    }
    
    return \%lookup;
}

# Register method with correct syntax
sml->add_to_class('str_column_to_int', \&str_column_to_int);
sub str_column_to_float {
    my ($self, $dataset, $column, %args) = @_;
    $args{precision} ||= 1;  # Precisión decimal por defecto: 1
    
    # Verifica si la columna contiene valores numéricos
    return if (!defined $dataset->[0][$column] || $dataset->[0][$column] !~ /^-?\d+\.?\d*$/);
    
    my $format = '%.' . $args{precision} . 'f';
    
    for my $row (@$dataset) {
        next unless defined $row->[$column];  # Salta valores undefined
        $row->[$column] = sprintf($format, $row->[$column]);
    }
}

# Registro en la clase sml (sintaxis corregida)
sml->add_to_class('str_column_to_float', \&{'str_column_to_float'});

# Capitulo 2
sub dataset_minmax {
    my ($self, $dataset) = @_;
    if (ref $dataset  eq 'AI::MXNet::NDArray') {
        my $minmax = mx->nd->stack($dataset->min(axis=>0), $dataset->max(axis=>0), axis => 1);
        return $minmax;
    } 
    elsif (ref $dataset eq 'ARRAY') {
        my @minmax;
        for my $i (0 .. $#{$dataset->[0]}) {
            my $col_values = [map {$_->[$i]} @$dataset];
            my $value_min = min(@$col_values);
            my $value_max = max(@$col_values);
            push @minmax, [$value_min, $value_max];
        }
        return \@minmax;
    }
}

sml->add_to_class('dataset minmax', \&dataset_minmax);

sub normalize_dataset {
    my ($self, $dataset, $minmax) = @_;
    
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
        my $min = $minmax->slice_axis(axis=>1, begin=>0, end=>1)->T;
        my $max = $minmax->slice_axis(axis=>1, begin=>1, end=>2)->T;
        $dataset -> slice ([0, $dataset->shape->[0]-1],[0, $dataset->shape->[1]-1] ).= ($dataset-$min)/($max-$min);

    } 
    elsif (ref($dataset) eq 'ARRAY') {
        for my $row (@$dataset) {
            for my $i (0 .. $#$row) {
                $row->[$i] = ($row->[$i] - $minmax->[$i][0]) / ($minmax->[$i][1] - $minmax->[$i][0]);
            }
        }
        return $dataset;
    }
}

sml->add_to_class('normalize_dataset', \&normalize_dataset);

my $column_means = sub {
    my ($self, $dataset) = @_;
    
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
        return mx->nd->mean($dataset, axis => 0);
    }
    elsif (ref($dataset) eq 'ARRAY') {
        my $means = [0, map {$_} 0 .. $#{$dataset->[0]} -1];
        for my $i (0 .. $#{$dataset->[0]}) {
            my $col_values = [map {$_->[$i]} @$dataset];
            $means->[$i] = sum(@$col_values) / scalar(@$dataset);
        }
        return $means;
    }
};

sml->add_to_class('column_means', $column_means);
my $column_stdevs = sub {
    my ($self, $dataset, $means) = @_;
    
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
        return mx->nd->sqrt(($dataset - $means)->power(2)->sum(axis=>0)/($dataset->len-1));
    }
    elsif (ref($dataset) eq 'ARRAY') {
        my $stdevs = [ (0) x @{$dataset->[0]} ];
        for my $i (0 .. $#{$dataset->[0]}) {
            my $variance = [map { ($_->[$i] - $means->[$i]) ** 2 } @$dataset];
            $stdevs->[$i] = sqrt(sum(@$variance) / (scalar(@$dataset) - 1));
        }
        return $stdevs;
    }
};

sml->add_to_class('column_stdevs', $column_stdevs);
sub standardize_dataset {
    my ($self, $dataset, $means, $stdevs) = @_;
    
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
            $means  = $means->reshape([1, -1]);
            $stdevs = $stdevs->reshape([1, -1]);

            $stdevs += 1e-8;

            $dataset .= ($dataset - $means) / $stdevs;
        }
    elsif (ref($dataset) eq 'ARRAY') {
        for my $row (@$dataset) {
            for my $i (0 .. $#{$row}) {
                $row->[$i] = ($row->[$i] - $means->[$i]) / $stdevs->[$i];
            }
        }
        return $dataset;
    }
}

sml->add_to_class('standardize_dataset', \&standardize_dataset);

# capitulo 3

sub train_test_split {
    my ($dataset, %args) = (splice (@_, 0, 1), split=>0.6, @_);
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
        my $train_size = int($args{'split'} * $dataset->len);
        my $idx = mx->nd->arange(stop=>$dataset->len)->shuffle;
        my $train_idx = $idx->slice([0, $train_size - 1]);
        my $test_idx = $idx->slice([$train_size, $dataset->len - 1]);
        my $train = mx->nd->take($dataset, $train_idx);
        my $test = mx->nd->take($dataset, $test_idx);
        return $train, $test;
    }
    elsif (ref($dataset) eq 'ARRAY') {
        my $train_size = int($args{split} * @$dataset);
        my @idx = shuffle(0 .. $#$dataset);
        my @train_idx = @idx[0 .. $train_size -1];
        my @test_idx = @idx[$train_size .. $#$dataset];
        my @train = @$dataset[@train_idx];
        my @test = @$dataset[@test_idx];
        return \@train, \@test;
    }
}

sml->add_to_class('train_test_split', \&train_test_split);

sub cross_validation_split {
    my ($self, $dataset, %args) = (splice(@_, 0, 2), n_folds=>10, @_);
    my @dataset_split;

    if (ref($dataset) eq 'AI::MXNet::NDArray') {
        my $total_rows = $dataset->shape->[0];
        my $fold_size = int($total_rows / $args{n_folds});

        # Shuffle indices
        my $indices = mx->nd->arange(stop => $total_rows)->shuffle;

        for my $i (0 .. $args{n_folds} - 1) {
            my $start = $i * $fold_size;
            my $end   = ($i == $args{n_folds} - 1) ? $total_rows : ($i + 1) * $fold_size;

            # Slice 1D index tensor correctamente
            my $fold_indices = $indices->slice_axis(axis => 0, begin => $start, end => $end);
            my $fold = mx->nd->take($dataset, $fold_indices);
            push @dataset_split, $fold;
        }

        return mx->nd->stack(@dataset_split, axis=>0);
    }
    else {
        
        my $fold_size = int(@$dataset / $args{n_folds});
        my @idx = shuffle(0 .. $#$dataset);
        
        for my $i (0 .. $args{n_folds}-1) {
            my @fold_idx = @idx[$i*$fold_size .. ($i+1)*$fold_size-1];
            push @dataset_split, [@$dataset[@fold_idx]];
        }
        return \@dataset_split;
    }
}

sml->add_to_class('cross_validation_split', \&cross_validation_split);

sub count_labels {
    my ($self, $dataset) = @_;
    
    if (ref($dataset) eq 'AI::MXNet::NDArray') {
  
        my $labels = $dataset->slice('X', -1)->squeeze;
    
        my $num_classes = $labels->max->asscalar + 1;
    
        my $counts = mx->nd->one_hot($labels, $num_classes)->sum(axis => 0);
   
        my %result;
        foreach my $i (0..$num_classes-1) {
            $result{"$i"} = $counts->at($i)->asscalar;
        }
        
        return \%result;
    }
    else {
        
        my %counts;
        $counts{$_->[-1]}++ foreach @$dataset;
        return \%counts;
    }
}

sml->add_to_class('count_labels', \&count_labels);

#chapter 4

my $accuracy_metric = sub{
    my ($self, $actual, $predicted) = @_;
    my $correct = 0;
        my $total_elements;

    if (ref($actual) eq 'AI::MXNet::NDArray' && ref($predicted) eq 'AI::MXNet::NDArray') {

                my $cmp = $predicted->astype($actual->dtype) == $actual;
        my $correct = $cmp->sum->asscalar;
        my $total = $actual->len;

        return sprintf '%.2f', ($correct / $total) * 100;

    } elsif (ref($actual) eq 'ARRAY' && ref($predicted) eq 'ARRAY') {
        # Lógica escalar para arrays de Perl (como tu implementación original)
        unless (@$actual == @$predicted) {
            die "Los tamaños de 'actual' y 'predicted' deben ser idénticos para ARRAY.";
        }

        $correct = 0;
        for my $pair (zip $actual, $predicted){
            $correct++ if ($pair->[0] == $pair->[1]);
        }
        $total_elements = @$actual;

    }
    return sprintf '%0.1f', $correct / @$actual * 100.0;
};
sml -> add_to_class('accuracy_metric', $accuracy_metric);

my $confusion_matrix = sub{
    my ($self, $actual, $predicted) = @_;
    
    if (ref($actual) eq 'AI::MXNet::NDArray' and ref($predicted) eq 'AI::MXNet::NDArray') {

        my $num_classes = $actual->max->asscalar +1;
        my $actual_one_hot = mx->nd->one_hot($actual, $num_classes);
        my $predicted_one_hot = mx->nd->one_hot($predicted, $num_classes);

        return mx->nd->arange (stop=>$num_classes), mx->nd->dot($actual_one_hot->T, $predicted_one_hot);
    }
    elsif (ref($actual) eq 'ARRAY' and ref($predicted) eq 'ARRAY') {
        my (%lookup, $x, $y);
        my @unique = uniq @$actual;
        my $matrix = [ map { [(0) x @unique] } @unique ];

        for my $i (0 .. $#unique) {
            $lookup{$unique[$i]} = $i;
        }
        for my $i (0 .. $#$actual) {
            $x = $lookup{$actual->[$i]};
            $y = $lookup{$predicted->[$i]};
            $matrix->[$x][$y]++;
        }
        return \@unique, $matrix;
    }
};

sml->add_to_class('confusion_matrix', $confusion_matrix);

# pretty print a confusion matrix
my $print_confusion_matrix = sub{
    my ($self, $unique, $matrix) = @_;
    print 'A/P'. join(' ', map {$_} @$unique), "\n";
    if (ref($matrix) eq 'AI::MXNet::NDArray') {
        printf "A/P %s", $unique->aspdl;
        printf "%s", mx->nd->concat($unique->expand_dims(axis=>1), $matrix, dim=>1)->aspdl;
    }
    elsif (ref($matrix) eq 'ARRAY') {
        for my $i (0 .. $#$unique) {
            printf "%s %s\n", $unique->[$i], join(' ', @{$matrix->[$i]});
        }
    }
};

sml->add_to_class('print_confusion_matrix', $print_confusion_matrix);

my $mae_metric = sub{
    my ($self, $actual, $predicted) = @_;
    my $sum_error = 0.0;

    if (ref($actual) eq 'AI::MXNet::NDArray' && ref($predicted) eq 'AI::MXNet::NDArray') {
        return sprintf '%0.3f', (mx->nd->abs($actual-$predicted)->sum/$actual->len)->asscalar;
    } elsif (ref($actual) eq 'ARRAY' && ref($predicted) eq 'ARRAY') {
        for my $pair (zip $actual, $predicted){
            $sum_error += abs($pair->[0] - $pair->[1]);
        }
        return sprintf '%.3f', $sum_error / @$actual;
    }
};

sml->add_to_class('mae_metric', $mae_metric);

my $rmse_metric = sub{
    my ($self, $actual, $predicted) = @_;
    my $sum_error = 0.0;

    if (ref($actual) eq 'AI::MXNet::NDArray' && ref($predicted) eq 'AI::MXNet::NDArray') {
        my $squared_diff = ($actual - $predicted)->square;
        $sum_error = $squared_diff->sum->asscalar;
        my $mean_error = $sum_error / $actual->size;
        return sprintf '%0.4f', sqrt($mean_error);
    } elsif (ref($actual) eq 'ARRAY' && ref($predicted) eq 'ARRAY') {
        for my $pair (zip $actual, $predicted){
            $sum_error += (($pair->[0] - $pair->[1]) ** 2);
        }
        my $mean_error = $sum_error / @$actual;
        return sprintf '%0.4f', sqrt($mean_error);
    }
};

sml->add_to_class('rmse_metric', $rmse_metric);

my $perf_metrics = sub{
    my ($self, $actual, $y_hat, $threshold) = @_;

    my ($tp, $fp, $tn, $fn, $tpr, $fpr) = (0, 0, 0, 0);

    if (ref($actual) eq 'AI::MXNet::NDArray' && ref($y_hat) eq 'AI::MXNet::NDArray') {
        my $predicted = $y_hat >= $threshold;

        my $num_classes = $actual->max->asscalar +1;
        my $actual_one_hot = mx->nd->one_hot($actual, $num_classes);
        my $predicted_one_hot = mx->nd->one_hot($predicted, $num_classes);

        my $confusion_matrix = mx->nd->dot($actual_one_hot->T, $predicted_one_hot);

        $tp = $confusion_matrix->at(1)->at(1);
        $fn = $confusion_matrix->at(1)->at(0);
        $fp = $confusion_matrix->at(0)->at(1);
        $tn = $confusion_matrix->at(0)->at(0);

        $tpr = $tp/($tp + $fn);
        $fpr = $fp / ($fp+$tn);

        return sprintf ('%0.2f', $fpr->asscalar), sprintf ('%0.2f', $tpr ->asscalar);

    } elsif (ref($actual) eq 'ARRAY' && ref($y_hat) eq 'ARRAY') {
        for my $i (0 .. $#$y_hat) {
            if ($y_hat->[$i] >= $threshold){
                if ($actual->[$i] == 1) {
                    $tp++;
                }else {
                    $fp++;
                }
            }else{
                if ($actual->[$i] == 0){
                    $tn++;
                }else{
                    $fn++;
                }
            }
        }
        $tpr = ($tp + $fn) == 0 ? 0 : $tp / ($tp + $fn); # True Positive Rate
        $fpr = ($fp + $tn) == 0 ? 0 : $fp / ($fp + $tn); # False Positive Rate

        return $fpr, $tpr;
    }
    

};

sml->add_to_class('perf_metrics', $perf_metrics);

my $trapz = sub {
    my ($self, $x, $y) = @_;

    my $sum = 0;
    if (ref($x) eq 'AI::MXNet::NDArray' && ref($y) eq 'AI::MXNet::NDArray') {
        my $x_vals = $x->aspdl;
        my $y_vals = $y->aspdl;
        
        for my $i (0 .. $x->size - 2) {
            $sum += ($x_vals->at($i + 1) - $x_vals->at($i)) * ($y_vals->at($i) + $y_vals->at($i + 1)) / 2;
        }
    } elsif (ref($x) eq 'ARRAY' && ref($y) eq 'ARRAY') {
        for my $i (0 .. @$x - 2){
            $sum += ($x->[$i + 1] - $x->[$i]) * ($y->[$i] + $y->[$i + 1]) / 2;
        }
    }
    return $sum;
};

sml->add_to_class('trapz', $trapz);

#chapter 5

my $random_algorithm = sub {
    my ($self, $train, $test) = @_;

    if (ref($train) eq 'AI::MXNet::NDArray' and ref($test) eq 'AI::MXNet::NDArray') {
        
        my $train_labels = $train->slice_axis(axis => 1, begin => $train->shape->[1] - 1, end => $train->shape->[1]);

        my @labels = $train_labels->aspdl->list;

        my %seen;
        my @unique = grep { !$seen{$_}++ } @labels;

        my $num_test_rows = $test->shape->[0];
        my @rand_indices = map { int(rand(@unique)) } (1 .. $num_test_rows);
        my @predicted_values = map { $unique[$_] } @rand_indices;

        my $predictions = mx->nd->array(\@predicted_values);
        return $predictions;
    }
    else {

        my @output_values = map { $_->[-1] } @$train;
        my %seen;
        my @unique = grep { !$seen{$_}++ } @output_values;

        return [ map { $unique[int(rand(@unique))] } @$test ];
    }
};

sml->add_to_class('random_algorithm', \&$random_algorithm);

my $zero_rule_algorithm_classification = sub {
    my ($self, $train, $test) = @_;

    if (ref($train) eq 'AI::MXNet::NDArray' and ref($test) eq 'AI::MXNet::NDArray') {
        my $label_col = $train->slice_axis(axis => 1, begin => $train->shape->[1] - 1, end => $train->shape->[1]);
        my @labels = $label_col->aspdl->list;
        my %counter;
        $counter{$_}++ for @labels;
        my $prediction_value = (sort { $counter{$b} <=> $counter{$a} } keys %counter)[0];

        my $num_test_rows = $test->shape->[0];
        my $predictions = mx->nd->full([$num_test_rows], $prediction_value);

        return $predictions;
    }
    else {

        my @output_values = map { $_->[-1] } @$train;
        my %counter = ();
        map { $counter{$_}++ } @output_values; # Counts
        my $prediction = (sort { $counter{$b} <=> $counter{$a} } keys %counter)[0]; # Find the most frequent
        return [(($prediction) x scalar(@$test))]; # predictions
    }
};

sml->add_to_class('zero_rule_algorithm_classification', \&$zero_rule_algorithm_classification);

my $zero_rule_algorithm_regression = sub {
    my ($self, $train, $test) = @_;

    if (ref $train eq 'AI::MXNet::NDArray' && ref $test eq 'AI::MXNet::NDArray') {
        my $output_values_nd = $train->slice_axis(axis => 1, begin => $train->shape->[1] - 1, end => $train->shape->[1]);;
        my $sum_nd = $output_values_nd->sum();
        my $count = $output_values_nd->shape->[0];
        my $average_nd = $sum_nd / $count;
        my $prediction_value = $average_nd->asscalar();
        return mx->nd->full([$test->shape->[0]], $prediction_value);
    } elsif (ref $train eq 'ARRAY' && ref $test eq 'ARRAY') {
        my @output_values = map { $_->[-1] } @$train;
        my $sum_values = sum(@output_values);
        my $average = $sum_values / scalar(@output_values);
        my $prediction = sprintf '%.1f', $average;
        return [(($prediction) x scalar(@$test))];
    }
};
sml->add_to_class('zero_rule_algorithm_regression', \&$zero_rule_algorithm_regression);

