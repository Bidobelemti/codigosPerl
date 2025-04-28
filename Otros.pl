use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Otros ====================

# Bloque 1
$cadena = <<SALUDO;
hola,
buenos días,
adios,
SALUDO

print "Fin del bloque 1\n";
##################################################

# Bloque 2
my $meses = {Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12};

print "Fin del bloque 2\n";
##################################################

# Bloque 3
$hash{"Garlic"} = [4, "cloves", "medium"];

print "Fin del bloque 3\n";
##################################################

# Bloque 4
my $x = $A <=> $B;

print "Fin del bloque 4\n";
##################################################

# Bloque 5
$x = 'aba' cmp 'abc';

print "Fin del bloque 5\n";
##################################################

# Bloque 6
my $c = $A . " " . "cadena";

print "Fin del bloque 6\n";
##################################################

# Bloque 7
misubrutina();

print "Fin del bloque 7\n";
##################################################

# Bloque 8
function('varl' => 5, 'var?' => 2);

print "Fin del bloque 8\n";
##################################################

# Bloque 9
function2('nombre' => 'Maria', 'edad' => 20);

print "Fin del bloque 9\n";
##################################################

# Bloque 10
function3('nombre' => 'Maria', 'edad' => 20);

print "Fin del bloque 10\n";
##################################################

# Bloque 11
function3('nombre' => 'Mario');

print "Fin del bloque 11\n";
##################################################

# Bloque 12
function3('nombre' => 'Maria', 'edad' => 20, enfermo => 1);

print "Fin del bloque 12\n";
##################################################

# Bloque 13
# Una clase tiene atributos (propiedades) y métodos (funciones).

# Se define una clase con la palabra package

# Una clase que tenga un constructor (new) permite crear un objeto.

# Una clase sin constructor se llama clase estática.

print "Fin del bloque 13\n";
##################################################

# Bloque 14
my $empleado2 = new Empleado();

print "Fin del bloque 14\n";
##################################################

# Bloque 15
my $sueldo = new Sueldo();

print "Fin del bloque 15\n";
##################################################

# Bloque 16
$sueldo->{dias_trabajados} = 22;
$sueldo->{sueldo_diario} = 20;

print "Fin del bloque 16\n";
##################################################

# Bloque 17
my $sueldo2 = new Sueldo(18, 90);

print "Fin del bloque 17\n";
##################################################

# Bloque 18


print "Fin del bloque 18\n";
##################################################

