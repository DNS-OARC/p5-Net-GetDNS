package Net::GetDNS;

use common::sense;
use Carp;

=encoding utf8

=head1 NAME

Net::GetDNS - A modern asynchronous DNS API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  use Net::GetDNS;
  ...

=head1 DESCRIPTION

A modern asynchronous DNS API. See L<Net::GetDNS::XS> for Perl XS bindings.

=head1 METHODS

=over 4

=item new

=cut

sub new {
    my $this  = shift;
    my $class = ref( $this ) || $this;
    my $self  = {};
    bless $self, $class;

    return $self;
}

=back

=head1 AUTHOR

Jerry Lundström, C<< <lundstrom.jerry@gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to L<https://github.com/DNS-OARC/p5-Net-GetDNS/issues>.

=cut

1;
