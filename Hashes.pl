use strict;
use warnings;
use Data::Dump qw(dump);
use List::Util qw(zip min max sum);
use Tie::IxHash;


# ==================== Hashes ====================

# Bloque 1
print sprintf("%o", $x);

print "Fin del bloque 1\n";
##################################################

# Bloque 2
print sprintf("%X", $y);

print "Fin del bloque 2\n";
##################################################

# Bloque 3
print sprintf("%.3f", 3.14151692);

print "Fin del bloque 3\n";
##################################################

# Bloque 4
my $str = "Esta1es2877una3fraseEscuelaPolitecnicaNacional";
my $regex = '[A-Z][a-z]*';

for my $word ($str =~ m/$regex/g){
    printf "%s ", $word; 
}

print "Fin del bloque 4\n";
##################################################

# Bloque 5
my %months = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months;

print "Fin del bloque 5\n";
##################################################

# Bloque 6
print dump values %months;

print "Fin del bloque 6\n";
##################################################

# Bloque 7
tie my %months2, "Tie::IxHash";
 %months2 = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months2;

print "Fin del bloque 7\n";
##################################################

# Bloque 8
print dump values %months2;

print "Fin del bloque 8\n";
##################################################

# Bloque 9
my %stock = ();
print dump %stock;

print "Fin del bloque 9\n";
##################################################

# Bloque 10
%stock = (limones => 6, peras => 3, uvas => 2);
print dump %stock;

print "Fin del bloque 10\n";
##################################################

# Bloque 11
$stock{bananas} = 9;
print dump %stock;

print "Fin del bloque 11\n";
##################################################

# Bloque 12
$stock{bananas}--;
print dump %stock;

print "Fin del bloque 12\n";
##################################################

# Bloque 13
$stock{bananas} -= 3;
print dump %stock;

print "Fin del bloque 13\n";
##################################################

# Bloque 14
print dump (keys %$stock);

print "Fin del bloque 14\n";
##################################################

# Bloque 15
print dump (values %$stock);

print "Fin del bloque 15\n";
##################################################

# Bloque 16
while (my ($key, $value) = each(%$stock)){
    print $key, "\t", $value, "\n"; 
}

print "Fin del bloque 16\n";
##################################################

# Bloque 17
delete $stock->{manzana};

print "Fin del bloque 17\n";
##################################################

# Bloque 18
undef %$stock;
print dump $stock;

print "Fin del bloque 18\n";
##################################################

# Bloque 19
%$stock = ();
print dump $stock;

print "Fin del bloque 19\n";
##################################################

# Bloque 20
print map "$_ = $stock->{$_}\n", keys %$stock;

print "Fin del bloque 20\n";
##################################################

# Bloque 21
while (my ($key, $valor) = each %$stock){
    print "$key = $valor\n";
}

print "Fin del bloque 21\n";
##################################################

# Bloque 22
%A = ( x => 5, y => 3, z => 'abc');
$b = exists $A{z};
$c = exists $A{w};
print dump ($b, $c);

print "Fin del bloque 22\n";
##################################################

# Bloque 23
my %rev_meses = reverse %$meses;
print $rev_meses{1}, "\n";
print dump %rev_meses;

print "Fin del bloque 23\n";
##################################################

# Bloque 24
my %hash = (Apples => [4, "Delicious red", "medium"],
            "Canadian Bacon" => [1, "package", "1/2 pound"]
);

print "Fin del bloque 24\n";
##################################################

# Bloque 25
my %ignore = map {$_ => 1} ('c', 'ignore');
print dump (keys %ignore);

print "Fin del bloque 25\n";
##################################################

# Bloque 26
print dump grep {!exists $ignore{$_}} ('a', 'b', 'c', 'ignore');

print "Fin del bloque 26\n";
##################################################

# Bloque 27
my %hash = ();
if (%hash){
    print "Variable \%hash definida.\n";
}

print "Fin del bloque 27\n";
##################################################

# Bloque 28
while ($text =~ m/\b([a-z]+)\b/g){
    printf "%s\n", $1;
}

print "Fin del bloque 28\n";
##################################################

