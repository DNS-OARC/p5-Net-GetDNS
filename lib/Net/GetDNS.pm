package Net::GetDNS;

use common::sense;
use Carp;

=encoding utf8

=head1 NAME

Net::GetDNS - Perl bindings for getdns, a modern asynchronous DNS API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  ...

=head1 DESCRIPTION

Perl bindings for getdns, a modern asynchronous DNS API

=head1 METHODS

=over 4

=item new

=cut

use DynaLoader;
require XSLoader;
XSLoader::load( 'Net::GetDNS', $VERSION );
{
    my $libref = $DynaLoader::dl_librefs[ ( scalar @DynaLoader::dl_librefs - 1 ) ];

    foreach my $module ( qw(Context Dict List Bindata) ) {
        my ( $symref, $xs );

        unless ( ( $symref = DynaLoader::dl_find_symbol( $libref, 'boot_Net__GetDNS__XS__' . $module ) ) ) {
            confess 'Can not find symbol boot_Net__GetDNS__XS__' . $module;
        }
        $xs = DynaLoader::dl_install_xsub( 'Net::GetDNS::XS::' . $module . '::bootstrap', $symref );
        &$xs( 'Net::GetDNS::XS::' . $module );
    }
}

sub new {
    my $this  = shift;
    my $class = ref( $this ) || $this;
    my $self  = {
        xs => undef,
    };
    bless $self, $class;

    # uncoverable branch true
    unless ( defined( $self->{xs} = Net::GetDNS::XS->new() ) ) {

        # uncoverable statement
        confess 'Unable to create Net::GetDNS::XS object';
    }

    return $self;
}

=item XS

=cut

sub XS {
    return $_[0]->{xs};
}

=back

=head1 AUTHOR

Jerry Lundström, C<< <lundstrom.jerry@gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to L<https://github.com/DNS-OARC/p5-Net-GetDNS/issues>.

=cut

1;
