use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Arreglos ====================

# Bloque 1
my @array = ();
print dump @array;

print "Fin del bloque 1\n";
##################################################

# Bloque 2
print "@array";

print "Fin del bloque 2\n";
##################################################

# Bloque 3
@array = (10, 3, 7, "word");
print dump @array;

print "Fin del bloque 3\n";
##################################################

# Bloque 4
push @array, "new";
print "@array";

print "Fin del bloque 4\n";
##################################################

# Bloque 5
unshift @array, "beginning";
print dump @array;

print "Fin del bloque 5\n";
##################################################

# Bloque 6
splice @array, 2, 0, "between";
print dump @array;

print "Fin del bloque 6\n";
##################################################

# Bloque 7
my @array2 = @array[3 .. 5];
print "@array2";

print "Fin del bloque 7\n";
##################################################

# Bloque 8
print dump @array[1, 3, 5];

print "Fin del bloque 8\n";
##################################################

# Bloque 9
my $var1 = pop @array;
print "var1:$var1\n";
print "array:", dump @array;

print "Fin del bloque 9\n";
##################################################

# Bloque 10
$var1 = shift @array;
print "var1:$var1\n";
print "array:", dump @array;

print "Fin del bloque 10\n";
##################################################

# Bloque 11
$var1 = splice @array, 2, 1;
print "var1:$var1\n";
print "array:", dump @array;

print "Fin del bloque 11\n";
##################################################

# Bloque 12
push @array, @array; #concatenar 2 listas
print "array:", dump @array;

print "Fin del bloque 12\n";
##################################################

# Bloque 13
my @list1 = (0,1, 2);
my @list2 = (3,4,5);

print "Fin del bloque 13\n";
##################################################

# Bloque 14
my @lista3 = (@list1, @list2);
print "@lista3";

print "Fin del bloque 14\n";
##################################################

# Bloque 15
print dump @lista3;

print "Fin del bloque 15\n";
##################################################

# Bloque 16
print \@lista3;

print "Fin del bloque 16\n";
##################################################

# Bloque 17
print dump zip (\@list1, \@list2);

print "Fin del bloque 17\n";
##################################################

# Bloque 18
# El contenido entre paréntesis conforma una lista simple, 
   # representada por arroba @. () se asocia con @ - lista simple.
   # Para convertir una lista simple @ en referencia: \@
   
# El contenido entre corchetes conforma una referencia a un arreglo,
   # representada por dólar $. [] se asocia con $ - referencia a arreglo.
   # Para convertir una referencia $ a una lista simple: @$ o @{}

print "Fin del bloque 18\n";
##################################################

# Bloque 19
my $x = [1, 2, 3]; # Ejemplo de referencia a array
print "@$x";

print "Fin del bloque 19\n";
##################################################

# Bloque 20
my $y = [4, 5, 6]; # Ejemplo de referencia a array
my @list3 = map{$_->[0] + $_->[1]} zip ($x, $y);
print dump @list3;

print "Fin del bloque 20\n";
##################################################

# Bloque 21
my @arreglo = ();
print dump @arreglo;

print "Fin del bloque 21\n";
##################################################

# Bloque 22
push @arreglo, 3;
print dump @arreglo;

print "Fin del bloque 22\n";
##################################################

# Bloque 23
push @arreglo, 4;
print "@arreglo";

print "Fin del bloque 23\n";
##################################################

# Bloque 24
print dump @arreglo;

print "Fin del bloque 24\n";
##################################################

# Bloque 25
@arreglo = (1,3,5);
my @foo = @arreglo;
@arreglo =();
print "arreglo:", dump (@arreglo), "\n";
print "foo:", dump (@foo), "\n";

print "Fin del bloque 25\n";
##################################################

# Bloque 26
print dump @foo[0,2];

print "Fin del bloque 26\n";
##################################################

# Bloque 27
printf "Indice del ultimo de foo: %d\n", $#foo;
printf "Slice de foo: %s\n", dump @foo[0 .. $#foo];

print "Fin del bloque 27\n";
##################################################

# Bloque 28
my @a = (95,7,'fff');
printf"%s\n", $a[-1];
print "@a";

print "Fin del bloque 28\n";
##################################################

# Bloque 29
my @arreglo1 = (10,20,30);
my @arreglo2 = (100,200);
my @arreglo3 = (@arreglo1, @arreglo2, 8, " es una cadena");

my $len_arreglo3 = scalar(@arreglo3);
print "Longitud del arreglo3: ", $len_arreglo3, "\n";
print "Posicion del ultimo elemento de arreglo3:", $#arreglo3, "\n";
print "Longitud del arreglo3: ", scalar(@arreglo3), "\n";

print "Fin del bloque 29\n";
##################################################

# Bloque 30
print "$_\n" for @arreglo3;

print "Fin del bloque 30\n";
##################################################

# Bloque 31
for (@arreglo3){
    printf "%s\n", $_;
}

print "Fin del bloque 31\n";
##################################################

# Bloque 32
for my $elem (@arreglo3){
    printf "%s\n", $elem;
}

print "Fin del bloque 32\n";
##################################################

# Bloque 33
while (my ($i, $elem)= each @arreglo3){
    printf "%d\t%s\n", $i, $elem;
}

print "Fin del bloque 33\n";
##################################################

# Bloque 34
@a = (2 .. 7);
my @b = ('a' .. 'e');

print "$_ " for @a;
print "\n";
print "$_ " for @b;

print "Fin del bloque 34\n";
##################################################

# Bloque 35
print 'Suma de @a: ', sum(@a);

print "Fin del bloque 35\n";
##################################################

# Bloque 36
@a = ('a' .. 'e');
my $a_str = join ":", @a;
print $a_str;

print "Fin del bloque 36\n";
##################################################

# Bloque 37
my @lista = split /\d+/, "Estaes2877una3frase";
print "@lista\n";

print "Fin del bloque 37\n";
##################################################

# Bloque 38
@a = ('a' .. 'e');
@b = splice(@a, 1, 2);
printf "\@a: %s\n", "@a";
printf "\@b: %s\n", "@b";

print "Fin del bloque 38\n";
##################################################

# Bloque 39
@a =('a' .. 'e');
@b = (1 .. 3);
splice @a, 2, 1, @b;

print "@a: ", dump (@a), "\n";

print "Fin del bloque 39\n";
##################################################

# Bloque 40
@a = ('a' .. 'e');
@b = (1 .. 3);
splice (@a, 2, 0, @b);
print "@a: ", dump(@a), "\n";

print "Fin del bloque 40\n";
##################################################

# Bloque 41
$arreglo = [[1,2,3],[4,5,6],[7,8,9]]; # Ejemplo de referencia a array 2D
print dump @{$arreglo->[1]}[0,2];

print "Fin del bloque 41\n";
##################################################

# Bloque 42
print dump @$arreglo[1,3];

print "Fin del bloque 42\n";
##################################################

# Bloque 43
my $longitud = @$arreglo;
print "# filas: ", $longitud, "\n";
my $columnas = @{$arreglo->[0]};
print "# columnas: ", $columnas, "\n";

print "Fin del bloque 43\n";
##################################################

# Bloque 44
for (my $i=0; $i < @$arreglo; $i++){
    print dump ($arreglo->[$i]), "\n";
}

print "Fin del bloque 44\n";
##################################################

# Bloque 45
print dump ($_), "\n" for (@$arreglo);

print "Fin del bloque 45\n";
##################################################

# Bloque 46
for (my $i = 0; $i < @$arreglo; $i++){
    for (my $j=0; $j < @{$arreglo->[$i]}; $j++){
        print $arreglo->[$i][$j], "\t";
    }
    print "\n";
}

print "Fin del bloque 46\n";
##################################################

# Bloque 47
@arreglo = ([1,2,3],[4,-5,6],[7,8,9],[10,11,12]);

print "Fin del bloque 47\n";
##################################################

# Bloque 48
for (my $i = 0; $i < @arreglo; $i++){
    print dump ($arreglo[$i]), "\n";
}

print "Fin del bloque 48\n";
##################################################

# Bloque 49
for (my $i = 0; $i < @arreglo; $i++){
    for (my $j=0; $j< @{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}

print "Fin del bloque 49\n";
##################################################

# Bloque 50
my @m1 = (1, "maria");
my @m2 = ("pablo", "guillermo", "silvina");
my @m3 = ("rosa", "agustin", 3);
my @m = (@m1, @m2, @m3);
print dump @m;

print "Fin del bloque 50\n";
##################################################

# Bloque 51
@m =(\@m1, \@m2, \@m3);
print dump @m;

print "Fin del bloque 51\n";
##################################################

# Bloque 52
@arreglo = ([1], [2,3], [4 .. 6], [7,8], [9]);
for (my $i=0; $i <= $#arreglo; $i++){
    for (my $j=0; $j <= $#{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}

print "Fin del bloque 52\n";
##################################################

# Bloque 53
@lista = ([[1,2,3],[4,5,6],[7,8,9]],
           [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"]],
           [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]] );
               
print $lista [0][1][2], "\n";
print $lista [2][2][1], "\n";

print "Fin del bloque 53\n";
##################################################

# Bloque 54
my $var = shift @arreglo;
print dump $var;

print "Fin del bloque 54\n";
##################################################

# Bloque 55
$var1 = shift @$var;
print dump $var1;

print "Fin del bloque 55\n";
##################################################

# Bloque 56
@a = ('a' .. 'e');
$b = shift @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}

print "Fin del bloque 56\n";
##################################################

# Bloque 57
@a = ('a' .. 'e');
$b = pop @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}

print "Fin del bloque 57\n";
##################################################

# Bloque 58
unshift @a, 1;
push @a, 9;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}
print "\n", "@a";

print "Fin del bloque 58\n";
##################################################

# Bloque 59
my @pila = ();
my @datos = (2, 4, 6);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

print "Fin del bloque 59\n";
##################################################

# Bloque 60
@pila = ();
@datos = (2, 4, 6, -1);
while (my $numero = shift @datos){
    unshift @pila, $numero;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

print "Fin del bloque 60\n";
##################################################

# Bloque 61
@pila = ();
@datos = (2, 4, 6, -1);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

print "Fin del bloque 61\n";
##################################################

# Bloque 62
my $l = @pila;
for (my $i = 0; $i < $l; $i++){
    print shift(@pila), " ";
}

print "Fin del bloque 62\n";
##################################################

# Bloque 63
print dump [split ",", "peras, 2"];

print "Fin del bloque 63\n";
##################################################

# Bloque 64
my %A = ( x => 5, y => 3, z => 'abc');
@b = keys %A;
my @v = values %A;
print "keys: @b\n";
print "values: @v\n";

print "Fin del bloque 64\n";
##################################################

# Bloque 65
my %dict = ();
map {$dict{$_->[0]} = $_->[1]} zip (\@b, \@v);
print dump %dict;

print "Fin del bloque 65\n";
##################################################

# Bloque 66
%A = ( x => 5, y => 3, z => 'abc');
@v = values %A;
print "@v";

print "Fin del bloque 66\n";
##################################################

# Bloque 67
my %hash = (key1 => [1,2,3], key2 => [4,5,6]); # Ejemplo de hash
map {print "$_ : \n"; map {print "\t$_\n"} @{$hash{$_}}} keys %hash;

print "Fin del bloque 67\n";
##################################################

# Bloque 68
my %student = ();

$student{'maria@epn.edu.ec'}{name} = 'Maria';
$student{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student{'maria@epn.edu.ec'}{edad} = 34;
$student{'jose@epn.edu.ec'}{name} = 'Jose';
$student{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student{'jose@epn.edu.ec'}{edad} = 25;

print dump %student;

print "Fin del bloque 68\n";
##################################################

# Bloque 69
my $student = {};

$student->{'maria@epn.edu.ec'} {name} = 'Maria';
$student->{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student->{'maria@epn.edu.ec'}{edad} = 34;
$student->{'jose@epn.edu.ec'}{name} = 'Jose';
$student->{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student->{'jose@epn.edu.ec'}{edad} = 25;

print dump $student;

print "Fin del bloque 69\n";
##################################################

# Bloque 70
@array = ();
if (@array){
    print "Variable \@array definida.\n";
}

print "Fin del bloque 70\n";
##################################################

# Bloque 71
@array = ('word') x 5; 
print dump @array;

print "Fin del bloque 71\n";
##################################################

# Bloque 72
my @frutas = ('aguacate', 'banana', 'naranja');
my $indice = 0;

while ($indice < @frutas) {
    print "indice: $indice\tfruta: $frutas[$indice]\n";
    $indice++;
}

print "Fin del bloque 72\n";
##################################################

# Bloque 73
my $text = "cadena"; 
print join ' ', ($text =~ m/([^aeiou]+[aeiou]+)/g);

print "Fin del bloque 73\n";
##################################################

# Bloque 74
print $_ . " " for @lista;

print "Fin del bloque 74\n";
##################################################

# Bloque 75
my @personas = (['nombre' => 'Maria', 'edad' => 20],
                ['nombre' => 'Jose', 'edad' => 30]);

print "Fin del bloque 75\n";
##################################################

# Bloque 76
my @stock = (); # Ejemplo de array vacío
print dump @stock;

print "Fin del bloque 76\n";
##################################################

# Bloque 77
# Asumiendo que Empleado es una clase definida en otro lugar
# my $empleado = new Empleado('Maria', 'maria@epn.edu.ec');

print "Fin del bloque 77\n";
##################################################

# Bloque 78
my $empleado2 = {}; # Hash reference
$empleado2->{nombre} = 'Jose'; 
$empleado2->{email} = 'jose@epn.edu.ec';

print "Fin del bloque 78\n";
##################################################

# Bloque 79
my %empleado2 = (
    nombre => 'Juan',
    email  => 'juan@example.com'
);

print "Fin del bloque 79\n";
##################################################

# Bloque 80
my $sueldo = {}; # Hash reference
$sueldo->{nombre} = 'Brian'; 
$sueldo->{email} = 'brian@epn.edu.ec';

print "Fin del bloque 80\n";
##################################################

# Bloque 81
my $sueldo2 = {}; # Hash reference
$sueldo2->{nombre} = 'Juan';  
$sueldo2->{email} = 'juan@epn.edu.ec';

print "Fin del bloque 81\n";
##################################################