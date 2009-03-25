package AS;

use strict;
use List::MoreUtils qw(uniq);
use List::Util qw(sum);
use List::Pairwise qw (grepp);
use GraphViz;
use AsnUtils;
use AsnIPCount;

# MODULES

# CONSTANTS

my $get_relationship_name = {
    -1 => 'customer',
    0  => 'peer',
    1  => 'provider',
    2  => 'sibling',
};

# STATICS

# METHODS

sub new
{
    my ( $class, $as_number ) = @_;

    my $self = {};

    $self->{as_number} = $as_number;

    foreach my $relationship_name ( values %{$get_relationship_name} )
    {
        $self->{$relationship_name} = [];
    }
    bless( $self, $class );

    return $self;
}

sub get_country_code
{
    my ($self) = @_;

    return AsnUtils::get_asn_country_code( $self->{as_number} );
}

sub get_as_number
{
    my ($self) = @_;

    return $self->{as_number};
}

sub add_relationship
{
    my ( $self, $other_as, $relationship_name ) = @_;

    # my  = $get_relationship_name->{$relationship_type};
    # die "Invalid relationship_type: $relationship_type" unless defined($relationship_name);
    die unless grep { $_ eq $relationship_name } values %{$get_relationship_name};

    push @{ $self->{$relationship_name} }, $other_as;

    #weaken($other_as);
}

sub get_relationship_types
{
    my ($self) = @_;

    return values %{$get_relationship_name};
}

sub get_nodes_for_relationship
{
    my ( $self, $relationship_name ) = @_;

    die "Invalid relationship_name: '$relationship_name'" unless grep { $_ eq $relationship_name } values %{$get_relationship_name};

    return $self->{$relationship_name};
}

sub get_asn_ip_address_count
{
    my ( $self ) = @_;
   
    #print STDERR "get_asn_ip_address_count " . $self->{as_number} . "\n";
    
    return 0 if ($self->{as_number} eq 'REST_OF_WORLD');

    my $ret = AsnIPCount::get_ip_address_count_for_asn($self->{as_number});

    return 0 if (!defined($ret));

    return $ret;
}

sub get_downstream_asns
{
    my ( $self ) = @_;

    #print STDERR "get_downstream_asns " . $self->{as_number} . "\n";

    return [uniq map {$_, @{$_->get_downstream_asns}} grep {$self->{as_number} ne 'REST_OF_WORLD'} @{$self->get_customers}];
}

sub get_downstream_ip_address_count
{
    my ( $self ) = @_;

    return 0 if ($self->{as_number} eq 'REST_OF_WORLD');

    my $downstream_asns = $self->get_downstream_asns;

    if ( @{$downstream_asns} == 0)
    {
        return 0;
    }

    return sum map {$_->get_asn_ip_address_count() } @{$downstream_asns};
}

sub get_customers
{
   my ( $self ) = @_;
   
   return $self->get_nodes_for_relationship('customer'); 
}

sub get_monitorable_ip_address_count
{
    my ( $self ) = @_;

    return $self->get_asn_ip_address_count() + $self->get_downstream_ip_address_count();
}

1;
