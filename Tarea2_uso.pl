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
