use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Entrada/Salida de archivos ====================

# Bloque 1
my $cadena = "Brothers\t$x\n"; 
print $cadena;

print "Fin del bloque 1\n";
##################################################

# Bloque 2
$cadena = 'Brothers\t$x\n'; 
print $cadena;

print "Fin del bloque 2\n";
##################################################

# Bloque 3
print dump $p;

print "Fin del bloque 3\n";
##################################################

# Bloque 4
print $p;

print "Fin del bloque 4\n";
##################################################

# Bloque 5
print $array[3];

print "Fin del bloque 5\n";
##################################################

# Bloque 6
print dump zip ([0,2,4], [1,3,5]);

print "Fin del bloque 6\n";
##################################################

# Bloque 7
my $y = [1,3,5];
print dump zip ($x, $y);

print "Fin del bloque 7\n";
##################################################

# Bloque 8
my ($a, $b) = (10,5);
my $suma = $a + $b;
print "Resultado:" . $suma . "\n";

$suma++;
print "Despues de incrementar: $suma \n";
print $suma += 3;

print "Fin del bloque 8\n";
##################################################

# Bloque 9
my $cadena = "palabraA\n";
chop($cadena);
print "$cadena ya no tiene salto de fila";

print "Fin del bloque 9\n";
##################################################

# Bloque 10
print "\U$cadena\E convertida a mayuscula";

print "Fin del bloque 10\n";
##################################################

# Bloque 11
print "\L$cadena\E convertida a minuscula. ";

print "Fin del bloque 11\n";
##################################################

# Bloque 12
print $arreglo[0];

print "Fin del bloque 12\n";
##################################################

# Bloque 13
$arreglo[0] = 5;
print $arreglo[0];

print "Fin del bloque 13\n";
##################################################

# Bloque 14
print dump(-1 .. 3), "\n";
print dump(-2 .. -2), "\n";

print "Fin del bloque 14\n";
##################################################

# Bloque 15
print dump(reverse -1 .. 3);

print "Fin del bloque 15\n";
##################################################

# Bloque 16
print dump (map {$_ / 10} -1 ..3);

print "Fin del bloque 16\n";
##################################################

# Bloque 17
print dump (grep {$_ > 0} -1 .. 3);

print "Fin del bloque 17\n";
##################################################

# Bloque 18
print $foo[-1], "\n";
print $foo[-2], "\n";

print "Fin del bloque 18\n";
##################################################

# Bloque 19
my $arreglo = [[1,2,3], [4, -5, 6], [7,8,9], [10,11,12]];
print dump $arreglo;

print "Fin del bloque 19\n";
##################################################

# Bloque 20
print $arreglo;

print "Fin del bloque 20\n";
##################################################

# Bloque 21
print dump $arreglo->[3];

print "Fin del bloque 21\n";
##################################################

# Bloque 22
print $arreglo ->[3][1];

print "Fin del bloque 22\n";
##################################################

# Bloque 23
print $arreglo;

print "Fin del bloque 23\n";
##################################################

# Bloque 24
print dump $arreglo->[3];

print "Fin del bloque 24\n";
##################################################

# Bloque 25
print $#arreglo, "\n";
print $#{$arreglo[1]}, "\n";

print "Fin del bloque 25\n";
##################################################

# Bloque 26
my $array = [[[1,2,3],[4,5,6],[7,8,9]],
           [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"]],
           [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]] ];
               
print $array->[0][1][2], "\n";
print $array->[2][2][1], "\n";

print "Fin del bloque 26\n";
##################################################

# Bloque 27
print $stock{peras};

print "Fin del bloque 27\n";
##################################################

# Bloque 28
$stock{peras} = 5;
print $stock{peras};

print "Fin del bloque 28\n";
##################################################

# Bloque 29
my $stock = alimenta_hash();
print dump $stock;

print "Fin del bloque 29\n";
##################################################

# Bloque 30
print $meses->{'Jan'}

print "Fin del bloque 30\n";
##################################################

# Bloque 31
print $hash{"Canadian Bacon"}->[1];

print "Fin del bloque 31\n";
##################################################

# Bloque 32
print $hash{"Garlic"}->[1];

print "Fin del bloque 32\n";
##################################################

# Bloque 33
my $A = 0;
my $B = 1;

print "A y B resulta verdadero\n" if $A and $B; 
print "A o B resulta verdadero\n" if $A or $B; 
print "A xor B resulta verdadero\n" if $A xor $B; 
print "A nand B resulta verdadero\n" if not ($A and $B);

print "Fin del bloque 33\n";
##################################################

# Bloque 34
print dump (1 .. 5);

print "Fin del bloque 34\n";
##################################################

# Bloque 35
print '-' x 5;

print "Fin del bloque 35\n";
##################################################

# Bloque 36
print $A, "\n"; 
$A++; 
print $A, "\n"; 
print $A++, "\n"; 
print $A, "\n";

print "Fin del bloque 36\n";
##################################################

# Bloque 37
my ($i, $suma) = (0, 0);
while ($i < 10) {
    $suma = $suma + $i++;
}
print "El resultado de la suma es: $suma";

print "Fin del bloque 37\n";
##################################################

# Bloque 38
# print maximo1(22, 55, 34, 75);

print "Fin del bloque 38\n";
##################################################

# Bloque 39
print suma(3, 35, 22, 5), "\n";

print "Fin del bloque 39\n";
##################################################

# Bloque 40
print suma2( 1 .. 8, "xa" ), "\n";

print "Fin del bloque 40\n";
##################################################

# Bloque 41
print $empleado->nombre();

print "Fin del bloque 41\n";
##################################################

# Bloque 42
print $empleado->email();

print "Fin del bloque 42\n";
##################################################

# Bloque 43
print dump $empleado;

print "Fin del bloque 43\n";
##################################################

# Bloque 44
print dump $empleado2;

print "Fin del bloque 44\n";
##################################################

# Bloque 45
print dump $empleado2;

print "Fin del bloque 45\n";
##################################################

# Bloque 46
print "nombre: $empleado2{nombre}\n";
print "email: $empleado2{email}\n";

print "Fin del bloque 46\n";
##################################################

# Bloque 47
print dump $sueldo;

print "Fin del bloque 47\n";
##################################################

# Bloque 48
print dump $sueldo;

print "Fin del bloque 48\n";
##################################################

# Bloque 49
print $sueldo->sueldo();

print "Fin del bloque 49\n";
##################################################

# Bloque 50
print $sueldo2->sueldo();

print "Fin del bloque 50\n";
##################################################

# Bloque 51
print dump $sueldo2;

print "Fin del bloque 51\n";
##################################################

