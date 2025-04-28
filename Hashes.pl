print sprintf("%o", $x);

##################################################

print sprintf("%X", $y);

##################################################

print sprintf("%.3f", 3.14151692);

##################################################

my $str = "Esta1es2877una3fraseEscuelaPolitecnicaNacional";
my $regex = '[A-Z][a-z]*';

for my $word ($str =~ m/$regex/g){
    printf "%s ", $word; 
}

##################################################

my %months = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months;

##################################################

print dump values %months;

##################################################

tie my %months2, "Tie::IxHash";
 %months2 = (Jan => 1, Feb => 2, Mar => 3,
              Apr => 4, May => 5, Jun => 6,
              Jul => 7, Aug => 8, Sep => 9,
              Oct => 10, Nov => 11, Dec => 12);
print dump keys %months2;

##################################################

print dump values %months2;

##################################################

my %stock = ();
print dump %stock;

##################################################

%stock = (limones => 6, peras => 3, uvas => 2);
print dump %stock;

##################################################

$stock{bananas} = 9;
print dump %stock;

##################################################

$stock{bananas}--;
print dump %stock;

##################################################

$stock{bananas} -= 3;
print dump %stock;

##################################################

print dump (keys %$stock);

##################################################

print dump (values %$stock);

##################################################

while (my ($key, $value) = each(%$stock)){
    print $key, "\t", $value, "\n"; 
}

##################################################

delete $stock->{manzana};

##################################################

undef %$stock;
print dump $stock;

##################################################

%$stock = ();
print dump $stock;

##################################################

print map "$_ = $stock->{$_}\n", keys %$stock;

##################################################

while (my ($key, $valor) = each %$stock){
    print "$key = $valor\n";
}

##################################################

%A = ( x => 5, y => 3, z => 'abc');
$b = exists $A{z};
$c = exists $A{w};
print dump ($b, $c);

##################################################

my %rev_meses = reverse %$meses;
print $rev_meses{1}, "\n";
print dump %rev_meses;

##################################################

my %hash = (Apples => [4, "Delicious red", "medium"],
            "Canadian Bacon" => [1, "package", "1/2 pound"]
);

##################################################

my %ignore = map {$_ => 1} ('c', 'ignore');
print dump (keys %ignore);

##################################################

print dump grep {!exists $ignore{$_}} ('a', 'b', 'c', 'ignore');

##################################################

my %hash = ();
if (%hash){
    print "Variable \%hash definida.\n";
}

##################################################

while ($text =~ m/\b([a-z]+)\b/g){
    printf "%s\n", $1;
}

##################################################

