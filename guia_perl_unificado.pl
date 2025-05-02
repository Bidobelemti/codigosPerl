# Todo código debe tener al menos esas 3 funciones
use strict;
use warnings;
use Data::Dump qw(dump);
# Librerías adicionales
use List::Util qw(zip min max sum);
use Tie::IxHash;
print "Hola Mundo!!!";
my $z = 0.127;
my $x = 3.22e-14;
my $c = 1567;
my $d = -122;
print $x; 
$x = 0377;
my $y = 0xff;
print $x;
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

$x = 0;
if ($x){
    print "Verdadero";
}else{
    print "Falso";
}
$x="";
if($x){
    print "Verdadero";
}else{
    print "Falso";
}
my $p;
if($p){
    print "Verdadero";
}else{
    print "Falso";
}
print dump $p;
print $p;
my @array = ();
print dump @array;
print "@array";
@array = (10, 3, 7, "word");
print dump @array;
push @array, "new";
print "@array";
unshift @array, "beginning";
print dump @array;
splice @array, 2, 0, "between";
print dump @array;
print $array[3];
my @array2 = @array[3 .. 5];
print "@array2";
print dump @array[1, 3, 5];
my $var1 = pop @array;
print "var1:$var1\n";
print "array:", dump @array;
$var1 = shift @array;
print "var1:$var1\n";
print "array:", dump @array;
$var1 = splice @array, 2, 1;
print "var1:$var1\n";
print "array:", dump @array;
push @array, @array; #concatenar 2 listas
print "array:", dump @array;
my @list1 = (0,1, 2);
my @list2 = (3,4,5);
my @lista3 = (@list1, @list2);
print "@lista3";
print dump @lista3;
print \@lista3;
print dump zip (\@list1, \@list2);
# El contenido entre paréntesis conforma una lista simple, 
   # representada por arroba @. () se asocia con @ - lista simple.
   # Para convertir una lista simple @ en referencia: \@
   
# El contenido entre corchetes conforma una referencia a un arreglo,
   # representada por dólar $. [] se asocia con $ - referencia a arreglo.
   # Para convertir una referencia $ a una lista simple: @$ o @{}
print dump zip ([0,2,4], [1,3,5]);
$x = [0,2,4];
print $x;
print "@$x";
$y = [1,3,5];
print dump zip ($x, $y);
my @list3 = map{$_->[0] + $_->[1]} zip ($x, $y);
print dump @list3;
my ($a, $b) = (10,5);
my $suma = $a + $b;
print "Resultado:" . $suma . "\n";

$suma++;
print "Despues de incrementar: $suma \n";
print $suma += 3;
$a = 'Mundo';
$b = 'Hola';
($a, $b) = ($b, $a);
print "La famosa frase es $a $b !!! \n";
$cadena = "palabraA\n";
chop($cadena);
print "$cadena ya no tiene salto de fila";
print "\U$cadena\E convertida a mayuscula";
print "\L$cadena\E convertida a minuscula. ";
my @arreglo = ();
print dump @arreglo;
push @arreglo, 3;
print dump @arreglo;
push @arreglo, 4;
print "@arreglo";
print dump @arreglo;
print $arreglo[0];
$arreglo[0] = 5;
print $arreglo[0];
@arreglo = (1,3,5);
my @foo = @arreglo;
@arreglo =();
print "arreglo:", dump (@arreglo), "\n";
print "foo:", dump (@foo), "\n";
print dump @foo[0,2];
print dump(-1 .. 3), "\n";
print dump(-2 .. -2), "\n";
print dump(reverse -1 .. 3);
print dump (map {$_ / 10} -1 ..3);
print dump (grep {$_ > 0} -1 .. 3);
printf "Indice del ultimo de foo: %d\n", $#foo;
printf "Slice de foo: %s\n", dump @foo[0 .. $#foo];
print $foo[-1], "\n";
print $foo[-2], "\n";
my @a = (95,7,'fff');
printf"%s\n", $a[-1];
print "@a";
my @arreglo1 = (10,20,30);
my @arreglo2 = (100,200);
my @arreglo3 = (@arreglo1, @arreglo2, 8, " es una cadena");

my $len_arreglo3 = scalar(@arreglo3);
print "Longitud del arreglo3: ", $len_arreglo3, "\n";
print "Posicion del ultimo elemento de arreglo3:", $#arreglo3, "\n";
print "Longitud del arreglo3: ", scalar(@arreglo3), "\n";
for(my $i =0; $i < @arreglo3; $i++){
    printf "%d\t%s\n", $i, $arreglo3[$i];
}
print "$_\n" for @arreglo3;
for (@arreglo3){
    printf "%s\n", $_;
}
for my $elem (@arreglo3){
    printf "%s\n", $elem;
}
foreach my $elem (@arreglo3){
    printf "%s\n", $elem;
}
while (my ($i, $elem)= each @arreglo3){
    printf "%d\t%s\n", $i, $elem;
}
@a = (2 .. 7);
my @b = ('a' .. 'e');

print "$_ " for @a;
print "\n";
print "$_ " for @b;
print 'Suma de @a: ', sum(@a);
@a = ('a' .. 'e');
$a = join ":", @a;
print $a; 
my @lista = split /\d+/, "Estaes2877una3frase";
print "@lista\n";
my $str = "Esta1es2877una3fraseEscuelaPolitecnicaNacional";
my $regex = '[A-Z][a-z]*';

for my $word ($str =~ m/$regex/g){
    printf "%s ", $word; 
}
@a = ('a' .. 'e');
@b = splice(@a, 1, 2);
printf "\@a: %s\n", "@a";
printf "\@b: %s\n", "@b";
@a =('a' .. 'e');
@b = (1 .. 3);
splice @a, 2, 1, @b;

print `@a: `, dump (@a), "\n";
@a = ('a' .. 'e');
@b = (1 .. 3);
splice (@a, 2, 0, @b);
print `@a: `, dump(@a), "\n";

my $arreglo = [[1,2,3], [4, -5, 6], [7,8,9], [10,11,12]];
print dump $arreglo;
print $arreglo;
print dump $arreglo->[3];
print $arreglo ->[3][1];
print $arreglo;
print dump $arreglo->[3];
print dump @{$arreglo->[3]}[0,2];
print dump @$arreglo[1,3];
my $longitud = @$arreglo;
print "# filas: ", $longitud, "\n";
my $columnas = @{$arreglo->[0]};
print "# columnas: ", $columnas, "\n";
for (my $i=0; $i < @$arreglo; $i++){
    print dump ($arreglo->[$i]), "\n";
}
for(@$arreglo){
    print dump ($_), "\n";
}
print dump ($_), "\n" for (@$arreglo);
for (my $i = 0; $i < @$arreglo; $i++){
    for (my $j=0; $j < @{$arreglo->[$i]}; $j++){
        print $arreglo->[$i][$j], "\t";
    }
    print "\n";
}
@arreglo = ([1,2,3],[4,-5,6],[7,8,9],[10,11,12]);
for (my $i = 0; $i < @arreglo; $i++){
    print dump ($arreglo[$i]), "\n";
}
for (my $i = 0; $i < @arreglo; $i++){
    for (my $j=0; $j< @{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}
my @m1 = (1, "maria");
my @m2 = ("pablo", "guillermo", "silvina");
my @m3 = ("rosa", "agustin", 3);
my @m = (@m1, @m2, @m3);
print dump @m;
@m =(\@m1, \@m2, \@m3);
print dump @m;
print $#arreglo, "\n";
print $#{$arreglo[1]}, "\n";
@arreglo = ([1], [2,3], [4 .. 6], [7,8], [9]);
for (my $i=0; $i <= $#arreglo; $i++){
    for (my $j=0; $j <= $#{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}
@lista = ([[1,2,3],[4,5,6],[7,8,9]],
           [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"]],
           [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]] );
               
print $lista [0][1][2], "\n";
print $lista [2][2][1], "\n";
my $array = [[[1,2,3],[4,5,6],[7,8,9]],
           [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"]],
           [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]] ];
               
print $array->[0][1][2], "\n";
print $array->[2][2][1], "\n";
my $var = shift @arreglo;
print dump $var;
$var1 = shift @$var;
print dump $var1;
@a = ('a' .. 'e');
$b = shift @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}
@a = ('a' .. 'e');
$b = pop @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}
unshift @a, 1;
push @a, 9;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}
print "\n", "@a";
my @pila = ();
my @datos = (2, 4, 6);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);
@pila = ();
@datos = (2, 4, 6, -1);
while (my $numero = shift @datos){
    unshift @pila, $numero;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);
@pila = ();
@datos = (2, 4, 6, -1);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);
my $l = @pila;
for (my $i = 0; $i < $l; $i++){
    print shift(@pila), " ";
}
my %months = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months;
print dump values %months;
foreach my $key (keys %months){
    print "$key = $months{$key}\n";
}
tie my %months2, "Tie::IxHash";
 %months2 = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months2;
print dump values %months2;
my %stock = ();
print dump %stock;
%stock = (limones => 6, peras => 3, uvas => 2);
print dump %stock;
print $stock{peras};
$stock{peras} = 5;
print $stock{peras};
$stock{bananas} = 9;
print dump %stock;
$stock{bananas}--;
print dump %stock;
$stock{bananas} -= 3;
print dump %stock;
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
if(exists $stock{bananas}){
    delete $stock{bananas};
}
print dump %stock;
$stock{aguacates} = 5;
print "\n", dump %stock;
print dump [split ",", "peras, 2"];
sub alimenta_hash{
    my %stock = ();
    open FILE, "data/frutas.txt" or die("Error: $!");
    while (<FILE>){
        chomp($_);
        map{$stock{$_->[0]} = $_->[1]} [split ",", $_];
    }
    close FILE or die ("Error: $!");
    return \%stock;
}
my $stock = alimenta_hash();
print dump $stock;
print dump (keys %$stock);
print dump (values %$stock); 
foreach my $clave (keys %$stock) {
print "$clave = $stock->{$clave}\n";
}
while (my ($key, $value) = each(%$stock)){
    print $key, "\t", $value, "\n"; 
}
delete $stock->{manzana}; 
undef %$stock;
print dump $stock; 
%$stock = ();
print dump $stock; 
$stock = alimenta_hash();
foreach my $clave (keys %$stock) {
    printf "fruta: %s: %d\n", $clave, $stock->{$clave}; 
}
print map "$_ = $stock->{$_}\n", keys %$stock;
while (my ($key, $valor) = each %$stock){
    print "$key = $valor\n";
}
my %A = ( x => 5, y => 3, z => 'abc');
@b = keys %A;
my @v = values %A;
print "keys: @b\n";
print "values: @v\n";
my %dict = ();
map {$dict{$_->[0]} = $_->[1]} zip (\@b, \@v);
print dump %dict;
%A = ( x => 5, y => 3, z => 'abc');
@v = values %A;
print "@v";
%A = ( x => 5, y => 3, z => 'abc');
$b = exists $A{z};
$c = exists $A{w};
print dump ($b, $c);
my %hash = (Apples => 1, apples => 4,
            artichokes => 3, Beets=> 9);
foreach my $key (sort keys %hash){
    print "$key = $hash{$key}\n";
}
my $monthsref = \%months;
foreach my $key (keys %$monthsref){
    print "$key = $monthsref->{$key}\n";
}
my $meses = {Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12};
print $meses->{'Jan'};
my %rev_meses = reverse %$meses;
print $rev_meses{1}, "\n";
print dump %rev_meses;
%hash = (Apples => [4, "Delicious red", "medium"],
            "Canadian Bacon" => [1, "package", "1/2 pound"]
);
print $hash{"Canadian Bacon"}->[1];
$hash{"Garlic"} = [4, "cloves", "medium"]; 
print $hash{"Garlic"}->[1]; 
foreach my $key (keys %hash){
    print "$key: \n";
    foreach my $val (@{$hash{$key}}){
        print "\t$val\n";
    }
    print "\n"; 
}
map {print "$_ : \n"; map {print "\t$_\n"} @{$hash{$_}}} keys %hash;
my %student = ();

$student{'maria@epn.edu.ec'}{name} = 'Maria';
$student{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student{'maria@epn.edu.ec'}{edad} = 34;
$student{'jose@epn.edu.ec'}{name} = 'Jose';
$student{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student{'jose@epn.edu.ec'}{edad} = 25;

print dump %student; 
foreach my $id (keys %student){
    printf "correo: %s\n", $id;
    printf "name: %s\n", $student{$id}{name};
    printf "cedula: %s\n", $student{$id}{cedula};
    printf "edad: %d\n\n", $student{$id}{edad}; 
}
my $student = {};

$student->{'maria@epn.edu.ec'} {name} = 'Maria';
$student->{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student->{'maria@epn.edu.ec'}{edad} = 34;
$student->{'jose@epn.edu.ec'}{name} = 'Jose';
$student->{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student->{'jose@epn.edu.ec'}{edad} = 25;

print dump $student;
my $estudiante = {
    "jose\@epn.edu.ec" => { cedula => 17897928798, edad => 25, name => "Jose" },
    "maria\@epn.edu.ec" => { cedula => 17889588534, edad => 34, name => "Maria" },
};

foreach my $id (keys %$estudiante){
    print "$id\n";
    print $estudiante->{$id}{name}, "\n";
    print $estudiante->{$id}{cedula}, "\n";
    print $estudiante->{$id}{edad}, "\n\n"; 
}
my %ignore = map {$_ => 1} ('c', 'ignore');
print dump (keys %ignore); 
print dump grep {!exists $ignore{$_}} ('a', 'b', 'c', 'ignore'); 
my $A = 0;
my $B = 1;

print "A y B resulta verdadero\n" if $A and $B; 
print "A o B resulta verdadero\n" if $A or $B; 
print "A xor B resulta verdadero\n" if $A xor $B; 
print "A nand B resulta verdadero\n" if not ($A and $B); 

$x = $A <=> $B;
$x = 'aba' cmp 'abc';
my $costo;
$costo = 100 unless $costo;
$A = 5;
$B = undef;
print "variable \$B definida con el valor $A.\n" if defined $A;
print "variable \$B no esta definida.\n" if defined $B;

$costo = 100 unless defined ($costo);

%hash = ();
if (%hash){
    print "Variable \%hash definida.\n";
}
@array = ();
if (@array){
    print "Variable \@array definida.\n";
}
$c = $A . " " . "cadena";
print dump (1 .. 5); 
print '-' x 5;
@array = ('word') x 5; 
print dump @array; 
print $A, "\n"; 
$A++; 
print $A, "\n"; 
print $A++, "\n"; 
print $A, "\n"; 
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
my 
$text = "Ingrese el nombre de un sistema operativo: ";

print $text; 
my $nombre = "LINUX"; 

if($nombre =~ m/linux/i){
    print "Ese si es un buen producto.\n"
}else{
    print "Le pedi que ingresara un nombre de sistema operativo.\n";
}
while ($text =~ m/\b([a-z]+)\b/g){
    printf "%s\n", $1;
}
print "Escriba un número mayor a 10.\n";
my $numero = 10;
unless ($numero > 10) {
    print "Error: $numero no es mayor a 10.\n";
}else{
    print "Número $numero es mayor a 10.\n"
}
my $i=0;
$suma = 0;
($i, $suma) = (0, 0);
while ($i < 10) {
    $suma = $suma + $i++;
}
print "El resultado de la suma es: $suma"; 
my @frutas = ('aguacate', 'banana', 'naranja');
my $indice = 0;

while ($indice < @frutas) {
    print "indice: $indice\tfruta: $frutas[$indice]\n";
    $indice++;
}

($i, $suma) = (0, 0);

do{
    $suma = $suma + $i++;  
}while($i < 10);

print "El resultado de la suma es: $suma"; 
($i, $suma) = (0, 0);

until($i == 10){
    $suma = $suma + $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n"; 
($i, $suma) = (0, 0);
 
until($i >= 10){
    $suma = $suma + $i;
    $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n"; 
($i, $suma) = (0, 0);
 
do{
    $suma = $suma + $i++; 
} until($i == 10);

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n"; 
$suma = 0;

for(my $i = 0; $i < 10; $i++){
    $suma += $suma + $i;
}

print "El resultado de la suma es $suma \n"; 
for(my ($i, $j) = (0, 0); $i < 10; $i++, $j+=2) {
    printf "i:%d j:%d\n", $i, $j; 
}
@lista = (7, 11, 22, 5, 6, 7, 45); 
foreach my $elemento (@lista) {
    printf "%d ", $elemento;
}
$text = "cadena"; 
print join ' ', ($text =~ m/([^aeiou]+[aeiou]+)/g); 
$text = "cadena"; 
foreach my $syl ($text =~ m/([^aeiou]+[aeiou])/g) {
    printf "%s\n" , $syl;
} 
foreach my $elemento (5 .. 9) {
    print $elemento . " ";
}
print $_ . " " for @lista; 
foreach my $elemento (1 .. 10) {
    print $elemento . " ";
    last if $elemento == 5;
}
foreach my $elemento (1 .. 10) {
    next if $elemento == 5;
    print $elemento . " ";
}
sub misubrutina{ 
    print "Soy una misubrutina.\n"; 
}
misubrutina();
sub maximo {
    my ($var1, $var2) = @_;
    return $var1 > $var2 ? $var1 : $var2;
}

sub saludar{ 
    print "¡Hola $_[0]!\n"; 
}

saludar("Cesar"); 
saludar("Sandra"); 
sub function{
    my %args = @_; 
    foreach my $key (keys %args){ 
        print $key, " ", $args{$key}, "\n";
    }
} 
function('varl' => 5, 'var?' => 2); 
sub function2{
    my %args = @_;
    
    print "Nombre: ", $args{nombre}, "\n";
    print "Edad: ", $args{edad}, "\n";
}
function2('nombre' => 'Maria', 'edad' => 20);
sub function3{
    my %args = (enfermo => 0, @_);

    if (!defined $args{nombre}){
        print STDERR "Argumento Nombre faltante.\n";
        return;
    }

    if (!defined $args{edad}){
        print STDERR "Argumento Edad faltante.\n";
        return;
    }

    print "Nombre: ", $args{nombre}, "\n";
    print "Edad: ", $args{edad}, "\n";
    print "Enfermo: ", $args{enfermo}, "\n";
}

function3('nombre' => 'Maria', 'edad' => 20);
function3('nombre' => 'Mario');
function3('nombre' => 'Maria', 'edad' => 20, enfermo => 1);
my @personas = (['nombre' => 'Maria', 'edad' => 20],
                ['nombre' => 'Jose', 'edad' => 30]);
sub obtiene_frutas{
    my @stock = (); # Limpieza del arreglo indexado
    open FILE, "data/frutas.txt" or die("Error $!");
    while (<FILE>){
        chomp ($_);
        push @stock, map {['fruta' => $_->[0], 'cantidad' => $_->[1]]} [split ",", $_];
    }
close FILE or die("Error $!");
return @stock;
}
sub function4{
    my %args = @_; 
    print "Fruta: ", $args {fruta}, " ";
    print "Cantidad: ", $args {cantidad}, "\n";
} 
my @stock = obtiene_frutas(); 

foreach my $fruta (@stock) {
    function4(@$fruta);
}
print dump @stock;
sub suma {
    my ($A, $B) = @_;

    $A + $B;
}

print suma(2, 3), "\n";
print suma(3, 35, 22, 5), "\n"; 
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
print suma2( 1 .. 8, "xa" ), "\n"; 

my $empleado = new Empleado('Maria', 'maria@epn.edu.ec');
print $empleado->nombre(); 
print $empleado->email();
print dump $empleado; 
my $empleado2 = new Empleado(); 
print dump $empleado2; 
$empleado2->nombre('Jose'); 
$empleado2->email (' jose@epn.edu.ec');
print dump $empleado2;
my %empleado2 = (
    nombre => 'Juan',
    email  => 'juan@example.com'
);
print "nombre: $empleado2{nombre}\n";
print "email: $empleado2{email}\n";
package Sueldo {
    use strict;
    use warnings;
    use base qw(Empleado);

    sub new {
        my ($class, $dias_trabajados, $sueldo_diario) = (shift, @_);

        $self = {
            dias_trabajados => $dias_trabajados // 0,
            sueldo_diario   => $sueldo_diario // 0,
        };
        return bless ($self, $class);
    }

    sub sueldo {
        $self = shift @_;

        # print "Father class: ", $self->SUPER::nombre(), "\n";

        return $self->{dias_trabajados} * $self->{sueldo_diario};
    }
}

my $sueldo = new Sueldo(); 
print dump $sueldo;
$sueldo->nombre('Brian'); 
$sueldo->email('brian@epn.edu.ec');
$sueldo->{dias_trabajados} = 22;
$sueldo->{sueldo_diario} = 20;
print dump $sueldo; 
print $sueldo->sueldo(); 
my $sueldo2 = new Sueldo(18, 90); 
$sueldo2->nombre('Juan');  
$sueldo2->email('juan@epn.edu.ec');
print $sueldo2->sueldo(); 
print dump $sueldo2; 

package Empleado {
    use strict;
    use warnings;

    sub new {
        my ($class, $nombre, $email) = (shift, @_);

        my $self = {
            nombre => $nombre,
            email  => $email,
        };

        return bless($self, $class);
    }

    sub nombre {
        my ($self, $nombre) = @_;
        $self->{nombre} = $nombre if $nombre;
        return $self->{nombre};
    }

    sub email {
        my ($self, $email) = @_;
        $self->{email} = $email if $email;
        return $self->{email};
    }
    
    1;
}



