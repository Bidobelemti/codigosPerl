#Guia Perl 

use strict;
use warnings;
use Data::Dump qw(dump);
# Librerías adicionales
use List::Util qw(zip min max sum);
use Tie::IxHash;
print "Hola MUndo!!!\n  --Creación de variables--";

my $z = 0.127;
my $x = 3.22e-14;
my $c = 1567;
my $d = -122;
print $x; 

$x = 0377;
my $y = 0xff;
print "Conversión de octal a decimal";
print $x;

print "Impresión de variables antes creadas";
print sprintf("%o", $x);
print $y; 
print sprintf("%X", $y); 
print sprintf("%.3f", 3.14151692); 
my $cadena = "Brothers\t$x\n"; 
print $cadena; 

$cadena = 'Brothers\t$x\n'; 
print $cadena;

$cadena = <<SALUDO;
hola,
buenos días,
adios,
SALUDO

print $cadena;