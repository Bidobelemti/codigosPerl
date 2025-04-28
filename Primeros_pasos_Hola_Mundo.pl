print "Hola Mundo!!!";

##################################################

$a = 'Mundo';
$b = 'Hola';
($a, $b) = ($b, $a);
print "La famosa frase es $a $b !!! \n";

##################################################

sub saludar{ 
    print "¡Hola $_[0]!\n"; 
}

saludar("Cesar"); 
saludar("Sandra");

##################################################

