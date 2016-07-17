package Net::GetDNS::XS;

use common::sense;
use Carp;

use Net::GetDNS;

=encoding utf8

=head1 NAME

Net::GetDNS::XS - XS layer for getdns

=head1 VERSION

See L<Net::GetDNS> for version.

=head1 SYNOPSIS

  ...

=cut

our ( @ISA, %EXPORT_TAGS, @EXPORT_OK );

BEGIN {
    require Exporter;
    @ISA         = qw(Exporter);
    %EXPORT_TAGS = (
        all => [
            qw(
              getdns_address
              getdns_context_create
              getdns_context_destroy
              getdns_context_get_api_information
              getdns_context_get_append_name
              getdns_context_get_dns_root_servers
              getdns_context_get_dns_transport
              getdns_context_get_dnssec_allowed_skew
              getdns_context_get_dnssec_trust_anchors
              getdns_context_get_edns_client_subnet_private
              getdns_context_get_edns_do_bit
              getdns_context_get_edns_extended_rcode
              getdns_context_get_edns_maximum_udp_payload_size
              getdns_context_get_edns_version
              getdns_context_get_follow_redirects
              getdns_context_get_idle_timeout
              getdns_context_get_limit_outstanding_queries
              getdns_context_get_num_pending_requests
              getdns_context_get_resolution_type
              getdns_context_get_suffix
              getdns_context_get_timeout
              getdns_context_get_tls_authentication
              getdns_context_get_tls_query_padding_blocksize
              getdns_context_get_upstream_recursive_servers
              getdns_context_run
              getdns_dict_create
              getdns_dict_create_with_context
              getdns_dict_destroy
              getdns_dict_get_bindata
              getdns_dict_get_data_type
              getdns_dict_get_dict
              getdns_dict_get_int
              getdns_dict_get_list
              getdns_dict_get_names
              getdns_dict_remove_name
              getdns_dict_set_bindata
              getdns_dict_set_dict
              getdns_dict_set_int
              getdns_dict_set_list
              getdns_get_api_version
              getdns_get_errorstr_by_id
              getdns_get_version
              getdns_list_create
              getdns_list_create_with_context
              getdns_list_destroy
              getdns_list_get_bindata
              getdns_list_get_data_type
              getdns_list_get_dict
              getdns_list_get_int
              getdns_list_get_length
              getdns_list_get_list
              getdns_list_set_bindata
              getdns_list_set_dict
              getdns_list_set_int
              getdns_list_set_list
              getdns_pretty_print_dict
              getdns_cancel_callback
              getdns_general
              getdns_hostname
              getdns_service
              getdns_get_api_version_number
              getdns_get_version_number
              getdns_address_sync
              getdns_general_sync
              getdns_hostname_sync
              getdns_service_sync
              )
        ]
    );
    @EXPORT_OK = (
        @{ $EXPORT_TAGS{all} },
    );
}

=head1 DESCRIPTION

XS layer for getdns

=head1 METHODS

Please see getdns API documentation for the following functions.

=over 4

=item getdns_address
=item getdns_context_create
=item getdns_context_destroy
=item getdns_context_get_api_information
=item getdns_context_get_append_name
=item getdns_context_get_dns_root_servers
=item getdns_context_get_dns_transport
=item getdns_context_get_dnssec_allowed_skew
=item getdns_context_get_dnssec_trust_anchors
=item getdns_context_get_edns_client_subnet_private
=item getdns_context_get_edns_do_bit
=item getdns_context_get_edns_extended_rcode
=item getdns_context_get_edns_maximum_udp_payload_size
=item getdns_context_get_edns_version
=item getdns_context_get_follow_redirects
=item getdns_context_get_idle_timeout
=item getdns_context_get_limit_outstanding_queries
=item getdns_context_get_num_pending_requests
=item getdns_context_get_resolution_type
=item getdns_context_get_suffix
=item getdns_context_get_timeout
=item getdns_context_get_tls_authentication
=item getdns_context_get_tls_query_padding_blocksize
=item getdns_context_get_upstream_recursive_servers
=item getdns_context_run
=item getdns_dict_create
=item getdns_dict_create_with_context
=item getdns_dict_destroy
=item getdns_dict_get_bindata
=item getdns_dict_get_data_type
=item getdns_dict_get_dict
=item getdns_dict_get_int
=item getdns_dict_get_list
=item getdns_dict_get_names
=item getdns_dict_remove_name
=item getdns_dict_set_bindata
=item getdns_dict_set_dict
=item getdns_dict_set_int
=item getdns_dict_set_list
=item getdns_get_api_version
=item getdns_get_errorstr_by_id
=item getdns_get_version
=item getdns_list_create
=item getdns_list_create_with_context
=item getdns_list_destroy
=item getdns_list_get_bindata
=item getdns_list_get_data_type
=item getdns_list_get_dict
=item getdns_list_get_int
=item getdns_list_get_length
=item getdns_list_get_list
=item getdns_list_set_bindata
=item getdns_list_set_dict
=item getdns_list_set_int
=item getdns_list_set_list
=item getdns_pretty_print_dict
=item getdns_cancel_callback
=item getdns_general
=item getdns_hostname
=item getdns_service
=item getdns_get_api_version_number
=item getdns_get_version_number
=item getdns_address_sync
=item getdns_general_sync
=item getdns_hostname_sync
=item getdns_service_sync

=back

=cut

use DynaLoader;
require XSLoader;
XSLoader::load( 'Net::GetDNS', $Net::GetDNS::VERSION );
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

=head1 AUTHOR

Jerry Lundström, C<< <lundstrom.jerry@gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to L<https://github.com/DNS-OARC/p5-Net-GetDNS/issues>.

=cut

1;
