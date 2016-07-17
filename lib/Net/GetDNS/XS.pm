package Net::GetDNS::XS;

use common::sense;
use Carp;

use Net::GetDNS;

=encoding utf8

=head1 NAME

Net::GetDNS::XS - Perl bindings for getdns, a modern asynchronous DNS API

=head1 VERSION

See L<Net::GetDNS> for version.

=head1 SYNOPSIS

  use Net::GetDNS::XS;
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
              getdns_context_set_append_name
              getdns_context_set_dns_root_servers
              getdns_context_set_dns_transport
              getdns_context_set_dnssec_allowed_skew
              getdns_context_set_dnssec_trust_anchors
              getdns_context_set_edns_client_subnet_private
              getdns_context_set_edns_do_bit
              getdns_context_set_edns_extended_rcode
              getdns_context_set_edns_maximum_udp_payload_size
              getdns_context_set_edns_version
              getdns_context_set_follow_redirects
              getdns_context_set_idle_timeout
              getdns_context_set_limit_outstanding_queries
              getdns_context_set_resolution_type
              getdns_context_set_return_dnssec_status
              getdns_context_set_suffix
              getdns_context_set_timeout
              getdns_context_set_tls_authentication
              getdns_context_set_tls_query_padding_blocksize
              getdns_context_set_upstream_recursive_servers
              getdns_context_set_use_threads
              getdns_convert_alabel_to_ulabel
              getdns_convert_dns_name_to_fqdn
              getdns_convert_fqdn_to_dns_name
              getdns_convert_ulabel_to_alabel
              getdns_display_ip_address
              getdns_root_trust_anchor
              getdns_validate_dnssec
              getdns_context_process_async
              getdns_dict_util_get_string
              getdns_dict_util_set_string
              getdns_pretty_print_list
              getdns_pretty_snprint_dict
              getdns_pretty_snprint_list
              getdns_print_json_dict
              getdns_print_json_list
              getdns_pubkey_pin_create_from_string
              getdns_pubkey_pinset_sanity_check
              getdns_snprint_json_dict
              getdns_snprint_json_list
              getdns_strerror
              getdns_validate_dnssec2
              )
        ]
    );
    @EXPORT_OK = (
        @{ $EXPORT_TAGS{all} },
    );
}

=head1 DESCRIPTION

Perl bindings for getdns, a modern asynchronous DNS API.

=head1 FUNCTIONS

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
=item getdns_context_set_append_name
=item getdns_context_set_dns_root_servers
=item getdns_context_set_dns_transport
=item getdns_context_set_dnssec_allowed_skew
=item getdns_context_set_dnssec_trust_anchors
=item getdns_context_set_edns_client_subnet_private
=item getdns_context_set_edns_do_bit
=item getdns_context_set_edns_extended_rcode
=item getdns_context_set_edns_maximum_udp_payload_size
=item getdns_context_set_edns_version
=item getdns_context_set_follow_redirects
=item getdns_context_set_idle_timeout
=item getdns_context_set_limit_outstanding_queries
=item getdns_context_set_resolution_type
=item getdns_context_set_return_dnssec_status
=item getdns_context_set_suffix
=item getdns_context_set_timeout
=item getdns_context_set_tls_authentication
=item getdns_context_set_tls_query_padding_blocksize
=item getdns_context_set_upstream_recursive_servers
=item getdns_context_set_use_threads
=item getdns_convert_alabel_to_ulabel
=item getdns_convert_dns_name_to_fqdn
=item getdns_convert_fqdn_to_dns_name
=item getdns_convert_ulabel_to_alabel
=item getdns_display_ip_address
=item getdns_root_trust_anchor
=item getdns_validate_dnssec
=item getdns_context_process_async
=item getdns_dict_util_get_string
=item getdns_dict_util_set_string
=item getdns_pretty_print_list
=item getdns_pretty_snprint_dict
=item getdns_pretty_snprint_list
=item getdns_print_json_dict
=item getdns_print_json_list
=item getdns_pubkey_pin_create_from_string
=item getdns_pubkey_pinset_sanity_check
=item getdns_snprint_json_dict
=item getdns_snprint_json_list
=item getdns_strerror
=item getdns_validate_dnssec2

=back

=cut

use DynaLoader;
require XSLoader;
XSLoader::load( 'Net::GetDNS', $Net::GetDNS::VERSION );
{
    my $libref = $DynaLoader::dl_librefs[ ( scalar @DynaLoader::dl_librefs - 1 ) ];

    foreach my $module ( qw(Context Dict List Bindata Unimpl) ) {
        my ( $symref, $xs );

        unless ( ( $symref = DynaLoader::dl_find_symbol( $libref, 'boot_Net__GetDNS__XS__' . $module ) ) ) {
            confess 'Can not find symbol boot_Net__GetDNS__XS__' . $module;
        }
        $xs = DynaLoader::dl_install_xsub( 'Net::GetDNS::XS::' . $module . '::bootstrap', $symref );
        &$xs( 'Net::GetDNS::XS::' . $module );
    }
}

=head1 UNIMPLEMENTED

These functions have yet been implemented.

=over 4

=item getdns_context_create_with_extended_memory_functions
=item getdns_context_create_with_memory_functions
=item getdns_context_detach_eventloop
=item getdns_context_get_dns_transport_list
=item getdns_context_get_eventloop
=item getdns_context_get_namespaces
=item getdns_context_get_update_callback
=item getdns_context_set_context_update_callback
=item getdns_context_set_dns_transport_list
=item getdns_context_set_eventloop
=item getdns_context_set_extended_memory_functions
=item getdns_context_set_memory_functions
=item getdns_context_set_namespaces
=item getdns_context_set_update_callback
=item getdns_dict_create_with_extended_memory_functions
=item getdns_dict_create_with_memory_functions
=item getdns_fp2rr_list
=item getdns_list_create_with_extended_memory_functions
=item getdns_list_create_with_memory_functions
=item getdns_msg_dict2str
=item getdns_msg_dict2str_buf
=item getdns_msg_dict2str_scan
=item getdns_msg_dict2wire
=item getdns_msg_dict2wire_buf
=item getdns_msg_dict2wire_scan
=item getdns_rr_dict2str
=item getdns_rr_dict2str_buf
=item getdns_rr_dict2str_scan
=item getdns_rr_dict2wire
=item getdns_rr_dict2wire_buf
=item getdns_rr_dict2wire_scan
=item getdns_str2rr_dict
=item getdns_wire2msg_dict
=item getdns_wire2msg_dict_buf
=item getdns_wire2msg_dict_scan
=item getdns_wire2rr_dict
=item getdns_wire2rr_dict_buf
=item getdns_wire2rr_dict_scan

=back

=head1 AUTHOR

Jerry Lundström, C<< <lundstrom.jerry@gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to L<https://github.com/DNS-OARC/p5-Net-GetDNS/issues>.

=cut

1;
