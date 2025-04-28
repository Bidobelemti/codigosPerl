use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Bucles y repetición (for, while, until) ====================

# Bloque 1
for(my $i =0; $i < @arreglo3; $i++){
    printf "%d\t%s\n", $i, $arreglo3[$i];
}

print "Fin del bloque 1\n";
##################################################

# Bloque 2
foreach my $elem (@arreglo3){
    printf "%s\n", $elem;
}

print "Fin del bloque 2\n";
##################################################

# Bloque 3
for(@$arreglo){
    print dump ($_), "\n";
}

print "Fin del bloque 3\n";
##################################################

# Bloque 4
foreach my $key (keys %months){
    print "$key = $months{$key}\n";
}

print "Fin del bloque 4\n";
##################################################

# Bloque 5
foreach my $clave (keys %$stock) {
print "$clave = $stock->{$clave}\n";
}

print "Fin del bloque 5\n";
##################################################

# Bloque 6
$stock = alimenta_hash();
foreach $clave (keys %$stock) {
    printf "fruta: %s: %d\n", $clave, $stock->{$clave}; 
}

print "Fin del bloque 6\n";
##################################################

# Bloque 7
my %hash = (Apples => 1, apples => 4,
            artichokes => 3, Beets=> 9);
foreach my $key (sort keys %hash){
    print "$key = $hash{$key}\n";
}

print "Fin del bloque 7\n";
##################################################

# Bloque 8
my $monthsref = \%months;
foreach my $key (keys %$monthsref){
    print "$key = $monthsref->{$key}\n";
}

print "Fin del bloque 8\n";
##################################################

# Bloque 9
foreach my $key (keys %hash){
    print "$key: \n";
    foreach my $val (@{$hash{$key}}){
        print "\t$val\n";
    }
    print "\n"; 
}

print "Fin del bloque 9\n";
##################################################

# Bloque 10
foreach my $id (keys %student){
    printf "correo: %s\n", $id;
    printf "name: %s\n", $student{$id}{name};
    printf "cedula: %s\n", $student{$id}{cedula};
    printf "edad: %d\n\n", $student{$id}{edad}; 
}

print "Fin del bloque 10\n";
##################################################

# Bloque 11
($i, $suma) = (0, 0);

do{
    $suma = $suma + $i++;  
}while($i < 10);

print "El resultado de la suma es: $suma";

print "Fin del bloque 11\n";
##################################################

# Bloque 12
($i, $suma) = (0, 0);

until($i == 10){
    $suma = $suma + $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

print "Fin del bloque 12\n";
##################################################

# Bloque 13
($i, $suma) = (0, 0);
 
until($i >= 10){
    $suma = $suma + $i;
    $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

print "Fin del bloque 13\n";
##################################################

# Bloque 14
($i, $suma) = (0, 0);
 
do{
    $suma = $suma + $i++; 
} until($i == 10);

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

print "Fin del bloque 14\n";
##################################################

# Bloque 15
$suma = 0;

for(my $i = 0; $i < 10; $i++){
    $suma += $suma + $i;
}

print "El resultado de la suma es $suma \n";

print "Fin del bloque 15\n";
##################################################

# Bloque 16
for(my ($i, $j) = (0, 0); $i < 10; $i++, $j+=2) {
    printf "i:%d j:%d\n", $i, $j; 
}

print "Fin del bloque 16\n";
##################################################

# Bloque 17
my @lista = (7, 11, 22, 5, 6, 7, 45); 
foreach my $elemento (@lista) {
    printf "%d ", $elemento;
}

print "Fin del bloque 17\n";
##################################################

# Bloque 18
$text = "cadena"; 
foreach my $syl ($text =~ m/([^aeiou]+[aeiou])/g) {
    printf "%s\n" , $syl;
}

print "Fin del bloque 18\n";
##################################################

# Bloque 19
foreach my $elemento (5 .. 9) {
    print $elemento . " ";
}

print "Fin del bloque 19\n";
##################################################

# Bloque 20
foreach my $elemento (1 .. 10) {
    print $elemento . " ";
    last if $elemento == 5;
}

print "Fin del bloque 20\n";
##################################################

# Bloque 21
foreach my $elemento (1 .. 10) {
    next if $elemento == 5;
    print $elemento . " ";
}

print "Fin del bloque 21\n";
##################################################

# Bloque 22
sub function{
    my %args = @_; 
    foreach my $key (keys %args){ 
        print $key, " ", $args{$key}, "\n";
    }
}

print "Fin del bloque 22\n";
##################################################

# Bloque 23
my @stock = obtiene_frutas(); 

foreach my $fruta (@stock) {
    function4(@$fruta);
}

print "Fin del bloque 23\n";
##################################################

# Bloque 24
sub suma2{
    my $s = 0;
    
    foreach my $x (@_) {
        if ($x !~ m/^-?\d+(?:\.\d+)?$/){
            print STDERR "Valor '$x' no es un número válido. n"; 
            return;
        }
        $s += $x;
    }
    return $s;
}

print "Fin del bloque 24\n";
##################################################

