# Todo código debe tener al menos esas 3 funciones
use strict;
use warnings;
use Data::Dump qw(dump);

##################################################

# Librerías adicionales
use List::Util qw(zip min max sum);
use Tie::IxHash;

##################################################

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

##################################################

package Sueldo {
    use strict;
    use warnings;
    use base qw(Empleado);

    sub new {
        my ($class, $dias_trabajados, $sueldo_diario) = (shift, @_);

        my $self = {
            dias_trabajados => $dias_trabajados // 0,
            sueldo_diario   => $sueldo_diario // 0,
        };
        return bless ($self, $class);
    }

    sub sueldo {
        my $self = shift @_;

        # print "Father class: ", $self->SUPER::nombre(), "\n";

        return $self->{dias_trabajados} * $self->{sueldo_diario};
    }
}

##################################################

