use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Control de flujo (if, else, switch) ====================

# Bloque 1
$x = 0;
if ($x){
    print "Verdadero";
}else{
    print "Falso";
}

print "Fin del bloque 1\n";
##################################################

# Bloque 2
$x="";
if($x){
    print "Verdadero";
}else{
    print "Falso";
}

print "Fin del bloque 2\n";
##################################################

# Bloque 3
my $p;
if($p){
    print "Verdadero";
}else{
    print "Falso";
}

print "Fin del bloque 3\n";
##################################################

# Bloque 4
if (exists $stock{bananas}){
    print "Bananas exist.\n";
}elsif(!exists $stock{bananas}){
    print "Bananas do not exist.\n";
}
if (exists $stock{aguacates}){
print "Aguacates exist.\n";
}else{
print "Aguacates do not exist. \n";
}

print "Fin del bloque 4\n";
##################################################

# Bloque 5
if(exists $stock{bananas}){
    delete $stock{bananas};
}
print dump %stock;
$stock{aguacates} = 5;
print "\n", dump %stock;

print "Fin del bloque 5\n";
##################################################

# Bloque 6
my $costo;
$costo = 100 unless $costo;

print "Fin del bloque 6\n";
##################################################

# Bloque 7
$A = 5;
$B = undef;
print "variable \$B definida con el valor $A.\n" if defined $A;
print "variable \$B no esta definida.\n" if defined $B;

$costo = 100 unless defined ($costo);

print "Fin del bloque 7\n";
##################################################

# Bloque 8
my $objeto = "tiza";
my $requerido = "tiza";
my $cantidad = 22;

if ($objeto eq "tiza") {
    print "la variable objeto esta instanciada con tiza\n";
} else {
    print "la variable objeto NO esta instanciada con tiza\n";
}

if ($cantidad <= 25) {
    print "Hay que reponer " . ((25 - $cantidad) + 3) . " elementos\n";
}

print "Fin del bloque 8\n";
##################################################

# Bloque 9
my ($dividendo, $divisor, $resultado) = (4, 2);

if ($divisor == 0) {
    print STDERR "Error: no puedo dividir por cero!|n"; 
} 
elsif ($dividendo == 0){ 
    $resultado = $dividendo; 
}
elsif ($divisor == 1){ 
    $resultado = $dividendo; 
}
else{
    $resultado = $dividendo / $divisor;
} 

print "El resultado es ", $resultado, "\n" if $divisor != 0;

print "Fin del bloque 9\n";
##################################################

# Bloque 10
my 
$text = "Ingrese el nombre de un sistema operativo: ";

print $text; 
my $nombre = "LINUX"; 

if($nombre =~ m/linux/i){
    print "Ese si es un buen producto.\n"
}else{
    print "Le pedi que ingresara un nombre de sistema operativo.\n";
}

print "Fin del bloque 10\n";
##################################################

# Bloque 11
print "Escriba un número mayor a 10.\n";
my $numero = 10;
unless ($numero > 10) {
    print "Error: $numero no es mayor a 10.\n";
}else{
    print "Número $numero es mayor a 10.\n"
}

print "Fin del bloque 11\n";
##################################################

