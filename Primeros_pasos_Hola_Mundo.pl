use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Primeros pasos: "Hola Mundo" ====================

# Bloque 1
print "Hola Mundo!!!";

print "Fin del bloque 1\n";
##################################################

# Bloque 2
$a = 'Mundo';
$b = 'Hola';
($a, $b) = ($b, $a);
print "La famosa frase es $a $b !!! \n";

print "Fin del bloque 2\n";
##################################################

# Bloque 3
sub saludar{ 
    print "¡Hola $_[0]!\n"; 
}

saludar("Cesar"); 
saludar("Sandra");

print "Fin del bloque 3\n";
##################################################

