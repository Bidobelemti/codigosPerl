for(my $i =0; $i < @arreglo3; $i++){
    printf "%d\t%s\n", $i, $arreglo3[$i];
}

##################################################

foreach my $elem (@arreglo3){
    printf "%s\n", $elem;
}

##################################################

for(@$arreglo){
    print dump ($_), "\n";
}

##################################################

foreach my $key (keys %months){
    print "$key = $months{$key}\n";
}

##################################################

foreach my $clave (keys %$stock) {
print "$clave = $stock->{$clave}\n";
}

##################################################

$stock = alimenta_hash();
foreach $clave (keys %$stock) {
    printf "fruta: %s: %d\n", $clave, $stock->{$clave}; 
}

##################################################

my %hash = (Apples => 1, apples => 4,
            artichokes => 3, Beets=> 9);
foreach my $key (sort keys %hash){
    print "$key = $hash{$key}\n";
}

##################################################

my $monthsref = \%months;
foreach my $key (keys %$monthsref){
    print "$key = $monthsref->{$key}\n";
}

##################################################

foreach my $key (keys %hash){
    print "$key: \n";
    foreach my $val (@{$hash{$key}}){
        print "\t$val\n";
    }
    print "\n"; 
}

##################################################

foreach my $id (keys %student){
    printf "correo: %s\n", $id;
    printf "name: %s\n", $student{$id}{name};
    printf "cedula: %s\n", $student{$id}{cedula};
    printf "edad: %d\n\n", $student{$id}{edad}; 
}

##################################################

($i, $suma) = (0, 0);

do{
    $suma = $suma + $i++;  
}while($i < 10);

print "El resultado de la suma es: $suma";

##################################################

($i, $suma) = (0, 0);

until($i == 10){
    $suma = $suma + $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

##################################################

($i, $suma) = (0, 0);
 
until($i >= 10){
    $suma = $suma + $i;
    $i++;
}

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

##################################################

($i, $suma) = (0, 0);
 
do{
    $suma = $suma + $i++; 
} until($i == 10);

print "El resultado de la suma es: $suma.\n"; 
print "El valor de i es: $i.\n";

##################################################

$suma = 0;

for(my $i = 0; $i < 10; $i++){
    $suma += $suma + $i;
}

print "El resultado de la suma es $suma \n";

##################################################

for(my ($i, $j) = (0, 0); $i < 10; $i++, $j+=2) {
    printf "i:%d j:%d\n", $i, $j; 
}

##################################################

my @lista = (7, 11, 22, 5, 6, 7, 45); 
foreach my $elemento (@lista) {
    printf "%d ", $elemento;
}

##################################################

$text = "cadena"; 
foreach my $syl ($text =~ m/([^aeiou]+[aeiou])/g) {
    printf "%s\n" , $syl;
}

##################################################

foreach my $elemento (5 .. 9) {
    print $elemento . " ";
}

##################################################

foreach my $elemento (1 .. 10) {
    print $elemento . " ";
    last if $elemento == 5;
}

##################################################

foreach my $elemento (1 .. 10) {
    next if $elemento == 5;
    print $elemento . " ";
}

##################################################

sub function{
    my %args = @_; 
    foreach my $key (keys %args){ 
        print $key, " ", $args{$key}, "\n";
    }
}

##################################################

my @stock = obtiene_frutas(); 

foreach my $fruta (@stock) {
    function4(@$fruta);
}

##################################################

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

##################################################

