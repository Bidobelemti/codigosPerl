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

##################################################

sub misubrutina{ 
    print "Soy una misubrutina.\n"; 
}

##################################################

sub maximo {
    my ($var1, $var2) = @_;
    return $var1 > $var2 ? $var1 : $var2;
}

##################################################

# sub maximo1 {
#     return (sort {$b <=> $a} @_)[0];
# }

##################################################

sub function2{
    my %args = @_;
    
    print "Nombre: ", $args{nombre}, "\n";
    print "Edad: ", $args{edad}, "\n";
}

##################################################

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

##################################################

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

##################################################

sub function4{
    my %args = @_; 
    print "Fruta: ", $args {fruta}, " ";
    print "Cantidad: ", $args {cantidad}, "\n";
}

##################################################

sub suma {
    my ($A, $B) = @_;

    $A + $B;
}

print suma(2, 3), "\n";

##################################################

