my @array = ();
print dump @array;

##################################################

print "@array";

##################################################

@array = (10, 3, 7, "word");
print dump @array;

##################################################

push @array, "new";
print "@array";

##################################################

unshift @array, "beginning";
print dump @array;

##################################################

splice @array, 2, 0, "between";
print dump @array;

##################################################

my @array2 = @array[3 .. 5];
print "@array2";

##################################################

print dump @array[1, 3, 5];

##################################################

my $var1 = pop @array;
print "var1:$var1\n";
print "array:", dump @array;

##################################################

$var1 = shift @array;
print "var1:$var1\n";
print "array:", dump @array;

##################################################

$var1 = splice @array, 2, 1;
print "var1:$var1\n";
print "array:", dump @array;

##################################################

push @array, @array; #concatenar 2 listas
print "array:", dump @array;

##################################################

my @list1 = (0,1, 2);
my @list2 = (3,4,5);

##################################################

my @lista3 = (@list1, @list2);
print "@lista3";

##################################################

print dump @lista3;

##################################################

print \@lista3;

##################################################

print dump zip (\@list1, \@list2);

##################################################

# El contenido entre paréntesis conforma una lista simple, 
   # representada por arroba @. () se asocia con @ - lista simple.
   # Para convertir una lista simple @ en referencia: \@
   
# El contenido entre corchetes conforma una referencia a un arreglo,
   # representada por dólar $. [] se asocia con $ - referencia a arreglo.
   # Para convertir una referencia $ a una lista simple: @$ o @{}

##################################################

print "@$x";

##################################################

my @list3 = map{$_->[0] + $_->[1]} zip ($x, $y);
print dump @list3;

##################################################

my @arreglo = ();
print dump @arreglo;

##################################################

push @arreglo, 3;
print dump @arreglo;

##################################################

push @arreglo, 4;
print "@arreglo";

##################################################

print dump @arreglo;

##################################################

my @arreglo = (1,3,5);
my @foo = @arreglo;
@arreglo =();
print "arreglo:", dump (@arreglo), "\n";
print "foo:", dump (@foo), "\n";

##################################################

print dump @foo[0,2];

##################################################

printf "Indice del ultimo de foo: %d\n", $#foo;
printf "Slice de foo: %s\n", dump @foo[0 .. $#foo];

##################################################

my @a = (95,7,'fff');
printf"%s\n", $a[-1];
print "@a";

##################################################

my @arreglo1 = (10,20,30);
my @arreglo2 = (100,200);
my @arreglo3 = (@arreglo1, @arreglo2, 8, " es una cadena");

my $len_arreglo3 = scalar(@arreglo3);
print "Longitud del arreglo3: ", $len_arreglo3, "\n";
print "Posicion del ultimo elemento de arreglo3:", $#arreglo3, "\n";
print "Longitud del arreglo3: ", scalar(@arreglo3), "\n";

##################################################

print "$_\n" for @arreglo3;

##################################################

for (@arreglo3){
    printf "%s\n", $_;
}

##################################################

for my $elem (@arreglo3){
    printf "%s\n", $elem;
}

##################################################

while (my ($i, $elem)= each @arreglo3){
    printf "%d\t%s\n", $i, $elem;
}

##################################################

my @a = (2 .. 7);
my @b = ('a' .. 'e');

print "$_ " for @a;
print "\n";
print "$_ " for @b;

##################################################

print 'Suma de @a: ', sum(@a);

##################################################

@a = ('a' .. 'e');
$a = join ":", @a;
print $a;

##################################################

my @lista = split /\d+/, "Estaes2877una3frase";
print "@lista\n";

##################################################

@a = ('a' .. 'e');
@b = splice(@a, 1, 2);
printf "\@a: %s\n", "@a";
printf "\@b: %s\n", "@b";

##################################################

@a =('a' .. 'e');
@b = (1 .. 3);
splice @a, 2, 1, @b;

print `@a: `, dump (@a), "\n";

##################################################

@a = ('a' .. 'e');
@b = (1 .. 3);
splice (@a, 2, 0, @b);
print `@a: `, dump(@a), "\n";

##################################################

print dump @{$arreglo->[3]}[0,2]

##################################################

print dump @$arreglo[1,3];

##################################################

my $longitud = @$arreglo;
print "# filas: ", $longitud, "\n";
my $columnas = @{$arreglo->[0]};
print "# columnas: ", $columnas, "\n";

##################################################

for (my $i=0; $i < @$arreglo; $i++){
    print dump ($arreglo->[$i]), "\n";
}

##################################################

print dump ($_), "\n" for (@$arreglo);

##################################################

for (my $i = 0; $i < @$arreglo; $i++){
    for (my $j=0; $j < @{$arreglo->[$i]}; $j++){
        print $arreglo->[$i][$j], "\t";
    }
    print "\n";
}

##################################################

my @arreglo = ([1,2,3],[4,-5,6],[7,8,9],[10,11,12]);

##################################################

for (my $i = 0; $i < @arreglo; $i++){
    print dump ($arreglo[$i]), "\n";
}

##################################################

for (my $i = 0; $i < @arreglo; $i++){
    for (my $j=0; $j< @{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}

##################################################

my @m1 = (1, "maria");
my @m2 = ("pablo", "guillermo", "silvina");
my @m3 = ("rosa", "agustin", 3);
my @m = (@m1, @m2, @m3);
print dump @m;

##################################################

@m =(\@m1, \@m2, \@m3);
print dump @m;

##################################################

@arreglo = ([1], [2,3], [4 .. 6], [7,8], [9]);
for (my $i=0; $i <= $#arreglo; $i++){
    for (my $j=0; $j <= $#{$arreglo[$i]}; $j++){
        print $arreglo[$i][$j], "\t";
    }
    print "\n";
}

##################################################

@lista = ([[1,2,3],[4,5,6],[7,8,9]],
           [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"]],
           [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]] );
               
print $lista [0][1][2], "\n";
print $lista [2][2][1], "\n";

##################################################

my $var = shift @arreglo;
print dump $var;

##################################################

my $var1 = shift @$var;
print dump $var1;

##################################################

@a = ('a' .. 'e');
$b = shift @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}

##################################################

@a = ('a' .. 'e');
$b = pop @a;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}

##################################################

unshift @a, 1;
push @a, 9;
for (my $n = 0; $n < @a; $n++){
    print $a[$n], " ";
}
print "\n", "@a";

##################################################

my @pila = ();
my @datos = (2, 4, 6);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

##################################################

@pila = ();
@datos = (2, 4, 6, -1);
while (my $numero = shift @datos){
    unshift @pila, $numero;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

##################################################

@pila = ();
@datos = (2, 4, 6, -1);
while (@datos){
    unshift @pila, shift @datos;
}
print "\@datos: ", dump(@datos);
print "\n\@pila: ", dump(@pila);

##################################################

my $l = @pila;
for (my $i = 0; $i < $l; $i++){
    print shift(@pila), " ";
}

##################################################

print dump [split ",", "peras, 2"];

##################################################

my %A = ( x => 5, y => 3, z => 'abc');
@b = keys %A;
my @v = values %A;
print "keys: @b\n";
print "values: @v\n";

##################################################

my %dict = ();
map {$dict{$_->[0]} = $_->[1]} zip (\@b, \@v);
print dump %dict;

##################################################

%A = ( x => 5, y => 3, z => 'abc');
@v = values %A;
print "@v";

##################################################

map {print "$_ : \n"; map {print "\t$_\n"} @{$hash{$_}}} keys %hash;

##################################################

my %student = ();

$student{'maria@epn.edu.ec'}{name} = 'Maria';
$student{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student{'maria@epn.edu.ec'}{edad} = 34;
$student{'jose@epn.edu.ec'}{name} = 'Jose';
$student{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student{'jose@epn.edu.ec'}{edad} = 25;

print dump %student;

##################################################

my $student = {};

$student->{'maria@epn.edu.ec'} {name} = 'Maria';
$student->{'maria@epn.edu.ec'}{cedula} = 17889588534;
$student->{'maria@epn.edu.ec'}{edad} = 34;
$student->{'jose@epn.edu.ec'}{name} = 'Jose';
$student->{'jose@epn.edu.ec'}{cedula} = 17897928798;
$student->{'jose@epn.edu.ec'}{edad} = 25;

print dump $student;

##################################################

my @array = ();
if (@array){
    print "Variable \@array definida.\n";
}

##################################################

@array = ('word') x 5; 
print dump @array;

##################################################

my @frutas = ('aguacate', 'banana', 'naranja');
my $indice = 0;

while ($indice < @frutas) {
    print "indice: $indice\tfruta: $frutas[$indice]\n";
    $indice++;
}

##################################################

$text = "cadena"; 
print join ' ', ($text =~ m/([^aeiou]+[aeiou]+)/g);

##################################################

print $_ . " " for @lista;

##################################################

my @personas = (['nombre' => 'Maria', 'edad' => 20],
                ['nombre' => 'Jose', 'edad' => 30]);

##################################################

print dump @stock;

##################################################

my $empleado = new Empleado('Maria', 'maria@epn.edu.ec');

##################################################

$empleado2->nombre('Jose'); 
$empleado2->email (' jose@epn.edu.ec');

##################################################

my %empleado2 = (
    nombre => 'Juan',
    email  => 'juan@example.com'
);

##################################################

$sueldo->nombre('Brian'); 
$sueldo->email('brian@epn.edu.ec');

##################################################

$sueldo2->nombre('Juan');  
$sueldo2->email('juan@epn.edu.ec')

##################################################

