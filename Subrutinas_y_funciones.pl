use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Subrutinas y funciones ====================

# Bloque 1
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

print "Fin del bloque 1\n";
##################################################

# Bloque 2
sub misubrutina{ 
    print "Soy una misubrutina.\n"; 
}

print "Fin del bloque 2\n";
##################################################

# Bloque 3
sub maximo {
    my ($var1, $var2) = @_;
    return $var1 > $var2 ? $var1 : $var2;
}

print "Fin del bloque 3\n";
##################################################

# Bloque 4
# sub maximo1 {
#     return (sort {$b <=> $a} @_)[0];
# }

print "Fin del bloque 4\n";
##################################################

# Bloque 5
sub function2{
    my %args = @_;
    
    print "Nombre: ", $args{nombre}, "\n";
    print "Edad: ", $args{edad}, "\n";
}

print "Fin del bloque 5\n";
##################################################

# Bloque 6
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

print "Fin del bloque 6\n";
##################################################

# Bloque 7
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

print "Fin del bloque 7\n";
##################################################

# Bloque 8
sub function4{
    my %args = @_; 
    print "Fruta: ", $args {fruta}, " ";
    print "Cantidad: ", $args {cantidad}, "\n";
}

print "Fin del bloque 8\n";
##################################################

# Bloque 9
sub suma {
    my ($A, $B) = @_;

    $A + $B;
}

print suma(2, 3), "\n";

print "Fin del bloque 9\n";
##################################################

