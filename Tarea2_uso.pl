use strict;
use warnings;
use Data::Dump qw(dump);
use AI::MXNet qw(mx);
use Chart::Plotly;
use Chart::Plotly::Plot;
use Chart::Plotly::Trace::Scatter;
use Chart::Plotly qw(show_plot);
#Esto es de ejemplo
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