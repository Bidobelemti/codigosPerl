my $z = 0.127;
my $x = 3.22e-14;
my $c = 1567;
my $d = -122;
print $x;

##################################################

$x = 0377;
my $y = 0xff;

##################################################

print $x;

##################################################

print $y;

##################################################

my $x = [0,2,4];
print $x;

##################################################

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

##################################################

