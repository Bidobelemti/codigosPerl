$cadena = <<SALUDO;
hola,
buenos días,
adios,
SALUDO

##################################################

my $meses = {Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12};

##################################################

$hash{"Garlic"} = [4, "cloves", "medium"];

##################################################

my $x = $A <=> $B;

##################################################

$x = 'aba' cmp 'abc';

##################################################

my $c = $A . " " . "cadena";

##################################################

misubrutina();

##################################################

function('varl' => 5, 'var?' => 2);

##################################################

function2('nombre' => 'Maria', 'edad' => 20);

##################################################

function3('nombre' => 'Maria', 'edad' => 20);

##################################################

function3('nombre' => 'Mario');

##################################################

function3('nombre' => 'Maria', 'edad' => 20, enfermo => 1);

##################################################

# Una clase tiene atributos (propiedades) y métodos (funciones).

# Se define una clase con la palabra package

# Una clase que tenga un constructor (new) permite crear un objeto.

# Una clase sin constructor se llama clase estática.

##################################################

my $empleado2 = new Empleado();

##################################################

my $sueldo = new Sueldo();

##################################################

$sueldo->{dias_trabajados} = 22;
$sueldo->{sueldo_diario} = 20;

##################################################

my $sueldo2 = new Sueldo(18, 90);

##################################################



##################################################

