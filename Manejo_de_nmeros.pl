use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Manejo de números ====================

# Bloque 1
my $z = 0.127;
my $x = 3.22e-14;
my $c = 1567;
my $d = -122;
print $x;

print "Fin del bloque 1\n";
##################################################

# Bloque 2
$x = 0377;
my $y = 0xff;

print "Fin del bloque 2\n";
##################################################

# Bloque 3
print $x;

print "Fin del bloque 3\n";
##################################################

# Bloque 4
print $y;

print "Fin del bloque 4\n";
##################################################

# Bloque 5
my $x = [0,2,4];
print $x;

print "Fin del bloque 5\n";
##################################################

# Bloque 6
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

print "Fin del bloque 6\n";
##################################################

