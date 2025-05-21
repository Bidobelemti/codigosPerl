use strict;
use warnings;
use Data::Dump qw(dump);
use AI::MXNet qw(mx);
use Chart::Plotly;
use Chart::Plotly::Plot;
use Chart::Plotly::Trace::Scatter;
use Chart::Plotly qw(show_plot);
#Esto es de ejemplo
=pod
use Chart::Plotly 'show_plot';
my $data = { x    => [ 1 .. 10 ],
             mode => 'markers',
             type => 'scatter'
};
$data->{'y'} = [ map { rand 10 } @{ $data->{'x'} } ];
show_plot([$data]);
use aliased 'Chart::Plotly::Trace::Scattergl';
my $big_array = [ 1 .. 10000 ];
my $scattergl = Scattergl->new( x => $big_array, y => [ map { rand 100 } @$big_array ] );
show_plot([$scattergl]);
use Chart::Plotly qw(show_plot);
use PDL;
use aliased 'Chart::Plotly::Trace::Surface';
my $size = 25;
my $x    = ( xvals zeroes $size+ 1, $size + 1 ) / $size;
my $y    = ( yvals zeroes $size+ 1, $size + 1 ) / $size;
my $z    = 0.5 + 0.5 * ( sin( $x * 6.3 ) * sin( $y * 6.3 ) )**3;    # Bumps
my $surface = Surface->new( x => $x, y => $y, z => $z );
show_plot([$surface]);
use PDL::Math;
my $bessel_size = 50;
my $bessel      = Surface->new(
    x => xvals($bessel_size),
    y => xvals($bessel_size),
    z => bessj0( rvals( zeroes( $bessel_size, $bessel_size ) ) / 2 )
);
show_plot([$bessel]);
=cut
#pagina 2
my $x = mx->nd->arange(start => 0, 
                        stop => 12, 
                        step => 1, 
                        ctx => mx ->cpu(0));
print $x;
my $y = $x -> as_in_context(mx->cpu(1));
print $y;

my $z = $x + $y;
print $z ->aspdl;

$y = mx->nd->arange(stop => 12)->reshape([3, 4]);
print $y, $y->aspdl;

$x = $y->transpose();
print $x, $x->aspdl;
#pagina 3
$x = mx->nd->arange(stop => 12)->reshape([3,4]);
print $x->aspdl;

$y = mx->nd->arange(stop => 3)->reshape([3,1]);
print $y->aspdl;

$z = $x + $y;
print $z->aspdl;

$y = mx->nd->array([2]);
print $y->aspdl;

$z = $x + $y;
print $z->aspdl;

$x = mx->nd->arange(stop => 24) / 2;
print $x->aspdl;
#pagina 4
print $y->dtype;
$y = $y->astype('int32');
print $y->dtype;

$z = mx->nd->array([16.9, 8.0, 10.5], dtype=>'int32');
print "%s\n",$z->dtype;
print "%s\n",$z->aspdl;

print $x;

print ref($x);
print dump $x;
print $x->handle;
#pagina 5
print dump $x->shape;
print $x->shape->[0];

my ($rows, $cols) = @{$x->shape};
print dump ($rows, $cols);

print $x->len;
print $x->ndim;
print $x->size;
#pagina 6
$x = mx->nd->arange(start => 0, stop => 12)->reshape([3, 4]);
print $x->aspdl;

print $x->reshape([-1, 2])->aspdl;
print $x->transpose([0, 1])->aspdl;

$x = mx->nd->arange(start => 0, stop => 24);
$x = $x->reshape([2, 3, 4]);
print $x->aspdl;
#pagina 7
print $x->reshape([$x->len, -1])->aspdl;

$x = mx->nd->arange(stop => 24)->reshape([2, 3, 4]);
print $x->aspdl;
print $x->transpose([1, 0, 2])->aspdl;
#pagina 8
print $x->transpose([1, 2, 0])->aspdl;
$y = $x->transpose([1, 2, 0]);
#pagina 9
print $y->aspdl;
print dump $y->shape;
#pagina 10
my $var = mx->nd->zeros([2, 3, 4]);
print $var->aspdl;

$var = mx->nd->ones([2, 3, 4]);
print $var->aspdl;
#pagina 11
$var = mx->nd->ones([2, 3, 4]);
print $var->aspdl;

$var = mx->nd->full([2, 3, 4], 1e-9);
print $var->aspdl;

print mx->nd->random_normal(10, 5, shape => [3, 4])->aspdl;
#pagina 12
print mx->nd->random->normal(loc => 0, scale => 1, shape => [3, 4])->aspdl;

print mx->nd->array([[2, 1, 4, 3], [1, 2, 3, 4], [4, 3, 2, 1]])->aspdl;
$x = mx->nd->array([[2, 1, 4, 3], [1, 2, 3, 4], [4, 3, 2, 1]]);
print $x->aspdl;

my @array = (1, 2, 3);
print mx->nd->array(\@array)->aspdl;

my $array2 = [4, 5, 6];
my $nd_arr = mx->nd->array($array2);

print $nd_arr->aspdl;
#pagina 13
my $arr2 = [[2, 1, 4, 3], [1, 2, 3, 4], [4, 3, 2, 1]];
print mx->nd->array($arr2)->aspdl;

$array2 = $x ->asarray;
print dump $array2;  

my @lista2 = @{$x->asarray};
print dump @lista2;

$x = mx->nd->arange(stop=>30)->reshape([5, 6]);
#pagina 14
print $x->slice(begin=>[0,], end=>[2,])->aspdl;
print $x->slice(begin=>[0,], end=>[3,], step=>2)->aspdl;
print $x->slice(begin=>[0,0], end=>[3,6], step=>[2, 2])->aspdl;
print ref($x->slice(begin=>[0,0], end=>[3,6], step=>[2, 2]));

$y = $x->slice(begin=>[0,0], end=>[3,6], step=>[2, 2]); 
print $y->aspdl;
#pagina 15
print $x->slice(begin=>[0, 0], end=>$x->shape, step=>[1, 2])->aspdl;

print $x->slice(begin=>[0, 1], end=>$x->shape, step=>[1, 2])->aspdl;

print $x->slice(begin=>[0,0], end=>[$x->len,2])->aspdl;
#pagina 16
$y = $x->slice(begin=>[0,0], end=>[$x->len,2]); 
print $y->aspdl; 
print $y->sin()->aspdl;

$x->slice(begin=>[0,0], end=>[$x->len,2]) .= $y->sin(); 
print $x->aspdl;
#pagina 17
print ref $x->slice('X', [0, 1]);
$x->slice('X', [0, 1])->aspdl;

$x->slice('X', [0, 1]) .= $y->sin(); 
print $x->aspdl;

$x = mx->nd->arange(stop=>12)->reshape([3,4]); 
print $x->aspdl;

#pagina 18

$x->slice([0, 1], [2, 3]) .= mx->nd->full([2,2], 10); 
print $x->aspdl;

print mx->nd->slice_axis($x, axis=>0, begin=>1, end=>3)->aspdl;
print mx->nd->slice_axis($x, axis=>1, begin=>1, end=>4)->aspdl;
#pagina 19
$x = mx->nd->array([1, 2, 4, 8]); 
$y = mx->nd->array([2, 2, 2, 2]);

$z = $x + $y; 
print $z->aspdl;

$z = $x - $y; 
print $z->aspdl;

$z = $x * $y; 
print $z->aspdl;

$z = $x / $y; 
print $z->aspdl;

$z = $x ** $y;
print $z->aspdl;
#pagina 20
$y = mx->nd->array([2]); 
print "x->shape:", dump $x->shape; 
print "\ny->shape:", dump $y->shape;

$z = $x + $y; # Broadcast fue posible
print $z->aspdl;

$y = mx->nd->array([2, 2]); 
print "x->shape:", dump $x->shape; 
print "\ny->shape:", dump $y->shape;

print mx->nd->exp($x)->aspdl;

my $exp_nd = mx->nd->exp($x);
#pagina 21
$x = mx->nd->arange(stop => 12)->reshape([3, 4]);
print $x->aspdl;

$y = mx->nd->array([[2, 1, 4, 3], [1, 2, 3, 4]]);
$z = mx->nd->concat($x, $y, dim => 0);
print $z->aspdl;

@lista2 = ($x, $y, $y, $y);
$z = mx->nd->concat(@lista2, dim => 0);
print $z->aspdl;
#pagina 22
print "x->shape:", dump $x->shape;
print "\ny->shape:", dump $y->shape;
print $x->aspdl;
print $y->aspdl;
#pagina 23
$x = mx->nd->array([1, 2, 3]);
$y = mx->nd->array([4, 5, 3]);
$z = $x == $y;
print $z->aspdl;

$x = mx->nd->arange(stop => 12)->reshape([3, 4]);
print $x->aspdl;
print $x->sum()->aspdl;

print $x->sum(axis => 1)->aspdl;
print $x->sum(axis => 0, keepdims=>1)->aspdl;
print $x->sum(axis => 1)->aspdl;
#pagina 24
print $x;
print $x->aspdl;

$y = $x->expand_dims(2);
print $y;
print $y->aspdl;

print $y->squeeze(2);
#pagina 25
print $x->sum->asscalar, "\n";
print ref($x), "\n";
print ref(\$x->sum()->asscalar);

$x = mx->nd->array([2, 3, 4]);
$y = mx->nd->array([1, 5, 2]);
print $x->maximum($y)->aspdl;

$x = mx->nd->array([-2, -3, 4, 5]);
print $x->maximum(0)->aspdl;

$x = mx->nd->arange(stop=>100) / 10;
print $x->aspdl;

my $trace = [new Chart::Plotly::Trace::Scatter(x => $x->aspdl,
    y => $x->maximum(5)->aspdl,
    name => 'model',
    mode => 'lines')];

new Chart::Plotly::Plot(traces => $trace,
    layout => {title => {text => 'Plot of maximum(5)'},
    xaxis => {title => 'X'}, yaxis => {title => 'Y'}});
#pagina 26
$trace = [new Chart::Plotly::Trace::Scatter(x => $x->aspdl,
    y => $x->sin()->aspdl,
    name => 'model',
    mode => 'lines')];

new Chart::Plotly::Plot(traces => $trace,
    layout => {title => {text => 'Plot of sin(x)'},
    xaxis => {title => 'X'}, yaxis => {title => 'Y'}});

$trace = [new Chart::Plotly::Trace::Scatter(x => $x->aspdl,
    y => mx->nd->reverse($x->sin(), axis=>0)->aspdl,
    name => 'model',
    mode => 'lines')];

new Chart::Plotly::Plot(traces => $trace,
    layout => {title => {text => 'Plot of sin(x)'},
    xaxis => {title => 'X'}, yaxis => {title => 'Y'}});

print mx->nd->reverse($x, axis=>0)->aspdl;
$x = mx->nd->arange(stop => 4);
print $x->power(2)->aspdl;
#pagina 27
$x = mx->nd->arange(stop => 15)->reshape([5, 3]);
print "\nNot shuffled: ", $x->aspdl;
print "\nShuffled: ", $x->shuffle->aspdl;

sub factorial{
    my $n = shift;
    return $n == 0 ? 1 : mx->nd->prod(mx->nd->arange(start => 1, stop => $n + 1))->asscalar;
}
print factorial(5);
#pagina 28
$x = mx->nd->arange(stop=>12)->reshape([3,4]);
print $x;
print $x->aspdl;
printf "[1, 2, 3]: %s\n", mx->nd->pick($x, mx->nd->array([1, 2, 3]), axis => 1)->aspdl;
printf "[3, 3, 3]: %s\n", mx->nd->pick($x, mx->nd->array([3, 3, 3]), axis => 1)->aspdl;
printf "[3, 2, 1]: %s\n", mx->nd->pick($x, mx->nd->array([3, 2, 1]), axis => 1)->aspdl;
$x = mx->nd->array([[1, 2], [3, 4], [5, 6]]);
print $x;
print $x->aspdl;

print mx->nd->pick($x, mx->nd->array([1, 2]), axis => 0)->aspdl;
#pagina 29
print mx->nd->pick($x, mx->nd->array([1, 0, 1]), axis => 1)->aspdl;
print $x->aspdl;
print mx->nd->take($x, mx->nd->array([2, 0, 1, 1]), axis => 0)->aspdl;
print $x->aspdl;
print mx->nd->take($x, mx->nd->array([1, 0]), axis => 1)->aspdl;
#pagina 30
$y = mx->nd->array([[0.14883883, 0.7772398, 0.94865847, 0.7225052],
    [0.23729339, 0.6112595, 0.66538996, 0.5132841],
    [0.30822644, 0.9912457, 0.15502319, 0.7043658]]);

print mx->nd->contrib->arange_like($y)->aspdl;

printf "Shape as NDArray: %s\n", ref $x->shape_array();
printf "Shape: %s\n", $x->shape_array()->aspdl;

printf "Shape as Perl ARRAY: %s\n", ref $x->shape;
printf "Shape: %s\n", dump $x->shape;
#pagina 31
$x = mx->nd->array([[[1,2,3], [4,5,6], [7,8,9]], [[1,2,3], [4,5,6], [7,8,9]]]);
mx->nd->flatten($x)->aspdl;
mx->nd->flatten(mx->nd->array([[1, 2]]))->aspdl;

$x = mx->nd->array([[[1,2,3], [4,5,6], [7,8,9]], [[1,2,3], [4,5,6], [7,8,9]]]);
$y = mx->nd->flatten($x);
print $y->aspdl;
#pagina 32
mx->nd->full([2, 2], 5)->aspdl;
$var = mx->nd->full([2, 3, 4], 10);
print $var->aspdl;
#pagina 33
$x = mx->nd->array([[1, 2, 3]]);
print mx->nd->swapaxes($x, 0, 1)->aspdl;

$x = mx->nd->array([[[0,1], [2,3]], [[4,5], [6,7]]]);
print mx->nd->swapaxes($x, 0, 2)->aspdl;
#pagina 34
my $a = mx->nd->arange(stop => 3)->reshape([3, 1]);
my $b = mx->nd->arange(stop => 2)->reshape([1, 2]);
print $a->aspdl;
print $b->aspdl;
print (($a + $b)->aspdl);
#pagina 35
$x = mx->nd->arange(stop => 9)->reshape([3, 3]);
$y = mx->nd->arange(stop => 9)->reshape([3, 3]);
print dump 'handle(Y) before:', $y->handle;

$y = $y + $x;
print dump 'handle(Y) after:', $y->handle;

$z = mx->nd->zeros_like($y);
print dump 'handle(Z) before:', $z->handle;

$z .= $y + $x;
print dump 'handle(Z) after:', $z->handle;
#pagina 36
print dump 'handle(X) before:', $x->handle;
$x += $y;
print dump 'handle(X) after:', $x->handle;

mx->nd->save('temp.ndarray', [$x]);
$y = mx->nd->load('temp.ndarray');
print $y->[0]->aspdl;
#pagina 37
$x = mx->nd->array([[[2, 3, 4]], [[1, 0, 0]]]);
my $index_array = mx->nd->argsort($x, axis => 0);

$x = mx->nd->array([0.156, 0.3677, 0.2776]);
print mx->nd->argsort($x)->aspdl;

print $x->aspdl;

#print dump [map {sprintf '%.2f', $_} @($x->asarray)];

$x = mx->nd->array([5, 1, 4, 3]);
print mx->nd->sort($x)->aspdl;
print mx->nd->argsort($x, axis => 0)->aspdl;
#pagina 38
print mx->nd->argsort($x, axis => 'None')->aspdl;
print mx->nd->argsort($x, axis => 'None', is_ascend=>0)->aspdl;
$x = mx->nd->array([[1,2],[3,4]]);
print mx->nd->linalg->det($x)->aspdl;
$x = mx->nd->array([[[1, 2], [3, 4]], [[[1, 2], [2, 1]], [[1, 3], [3, 1]]]]);
print mx->nd->linalg->det($x)->aspdl;
#pagina 39
$x = mx->nd->array([[1, 2], [3, 4]]);
print mx->nd->linalg->inverse($x)->aspdl;
print mx->nd->dot($x, mx->nd->linalg->inverse($x))->aspdl;
#pagina 40
$x = mx->nd->array([[1, 3], [3, 5]]);
print mx->nd->linalg->inverse($x)->aspdl;

$x = mx->nd->array([[[1., 2.], [3., 4.]], [[1, 3], [3, 5]]]);
print mx->nd->linalg->inverse($x)->aspdl;
#pagina 41
my $probs = mx->nd->array([[0, 0.1, 0.2, 0.3, 0.4], [0.4, 0.3, 0.2, 0.1, 0]]);
mx->random->seed(1);
print mx->nd->sample_multinomial($probs)->aspdl;
mx->random->seed(1);
print mx->nd->sample_multinomial($probs, shape=>2)->aspdl;
mx->random->seed(1);
print mx->nd->random->multinomial($probs, shape=>2)->aspdl;

mx->random->seed(1);
my $vals_y_likelihood = mx->nd->sample_multinomial($probs, get_prob=>1);
printf "%s\n", $vals_y_likelihood;
print "@$vals_y_likelihood\n";
printf "values: %s\n", $vals_y_likelihood->[0]->aspdl;
printf "likelihood: %s\n", $vals_y_likelihood->[1]->aspdl;
#pagina 42
mx->random->seed(1);
$x = mx->nd->random->randn(5, 4);
print $x->aspdl;
#pagina 43
mx->random->seed(1);
print mx->nd->random->randn(2, 3, loc=>5, scale=>1)->aspdl;
mx->random->seed(1);
print mx->nd->random->uniform(0, 1)->aspdl;
#pagina 44
mx->random->seed(1);
print mx->nd->random->uniform(0, 1, ctx=>mx->cpu(1));

mx->random->seed(1);
print mx->nd->random->uniform(-1, 1, shape=>[2,])->aspdl;
mx->random->seed(1);
my $low = mx->nd->array([1,2,3]);
my $high = mx->nd->array([2,3,4]);
print mx->nd->random->uniform($low, $high, shape=>2)->aspdl;
#pagina 45

mx->random->seed(1);
print mx->nd->random->randint(5, 100)->aspdl;

mx->random->seed(1);
print mx->nd->random->randint(-10, 2, ctx=>mx->cpu(1))->aspdl;

mx->random->seed(1);
print mx->nd->random->randint(-10, 10, shape=>[2,])->aspdl;

my $A = [1, 2, 3];
my @B = (4, 5, 6);
print ref ($A);
#pagina 46
my $C = mx->nd->array($A);
print ref($C), "\n";
print $C->aspdl;
my $D = mx->nd->array(\@B, dtype => 'int32');
print ref($D), "\n";
print $D->aspdl;
print "\n", $D->dtype;
my $E = $C->asarray;
print ref($E), "\n";
print dump $E;

my @F = ($C->asarray);
print dump @F;

$a = mx->nd->array([3.5]);
print $a, "\n", $a->dtype, "\n", $a->asscalar;
#pagina 47
use AI::MXNet::Base;
my $x = mx->nd->arange(stop=>5);
my $y = $x + 5;
print $x->aspdl, " ", $y->aspdl, "\n";

for (zip($x, $y)) {
    my ($x1, $y1) = @$_;
    print $x1->aspdl, " ", $y1->aspdl, "\n";
}
printf "%s %s\n", $_->[0]->aspdl, $_->[1]->aspdl for (zip($x, $y));
#pagina 48
print map {$_->[0]->aspdl, " ", $_->[1]->aspdl, "\n";} zip($x, $y);

for (enumerate($x)){
    my ($i, $xi) = @$_;
    printf "%d %s\n", $i, $xi->aspdl;
}

printf "%d %s\n", $_->[0], $_->[1]->aspdl for (enumerate($x));
print map { sprintf("%d %s\n", $_->[0], $_->[1]->aspdl) } enumerate($x);
#pagina 49
my $X = mx->nd->arange(stop=>20)->reshape([10, 2]);
mx->random->seed(1);
my $y = mx->nd->random->randint(0, 2, shape=>[10, 1]);
my $dataset = mx->gluon->data->ArrayDataset(data => $X, label => $y);

printf "Original X for training: %s\n", $X->aspdl;
printf "Original y training: %s\n", $y->aspdl;

my $train_data = mx->gluon->data->DataLoader($dataset, batch_size => 3, shuffle => 1, last_batch => 'rollover');
print "num_batches: ", $train_data->len();
#pagina 50
for (my ($i, $batch, $X, $y) = 0; eval{ $batch = <$train_data>, ($X, $y) = @$batch}; $i++){
    print "X:", $X->aspdl;
    print "y:", $y->aspdl, "\n";
}
#pagina 51
my $X = mx->nd->arange(start=>20, stop=>30)->reshape([5, 2]);
mx->random->seed(2);
my $y = mx->nd->random->randint(0, 2, shape=>[5, 1]);
my $dataset = mx->gluon->data->ArrayDataset(data => $X, label => $y);

printf "Original X for testing: %s\n", $X->aspdl;
printf "Original y testing: %s\n", $y->aspdl;

my $test_data = mx->gluon->data->DataLoader($dataset, batch_size => 3, shuffle => 0, last_batch => 'keep');
printf "num_batches: %d\n\n", $test_data->len();

for (my ($i, $batch, $X, $y) = 0; eval{ $batch = <$test_data>, ($X, $y) = @$batch}; $i++){
    printf "X[%d]: %s\n", $i, $X->aspdl;
    printf "y[%d]: %s\n", $i, $y->aspdl;
}
