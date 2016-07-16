#include "net_getdns.h"
#include "compat_64bit.h"


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS  PREFIX = getdns_

PROTOTYPES: ENABLE

Net::GetDNS::XS::Context *
getdns_context_create(set_from_os)
    int set_from_os
PROTOTYPE: DISABLE
CODE:
    getdns_return_t r;
    if ((r = getdns_context_create(&RETVAL, set_from_os))) {
        croak(getdns_get_errorstr_by_id(r));
    }
OUTPUT:
    RETVAL

void
getdns_context_destroy(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $

Net::GetDNS::XS::Dict *
getdns_context_get_api_information(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_get_resolution_type(context, value)
    Net::GetDNS::XS::Context * context
    getdns_resolution_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_resolution_type(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_dns_transport(context, value)
    Net::GetDNS::XS::Context * context
    getdns_transport_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_dns_transport(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_limit_outstanding_queries(context, limit)
    Net::GetDNS::XS::Context * context
    uint16_t limit
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_limit_outstanding_queries(context, &limit);
OUTPUT:
    limit
    RETVAL

getdns_return_t
getdns_context_get_timeout(context, timeout)
    Net::GetDNS::XS::Context * context
    SV * timeout
PROTOTYPE: $$
CODE:
    uint64_t _timeout = 0;
    RETVAL = getdns_context_get_timeout(context, &_timeout);
    timeout = newSVUInt64(_timeout);
OUTPUT:
    timeout
    RETVAL

getdns_return_t
getdns_context_get_idle_timeout(context, timeout)
    Net::GetDNS::XS::Context * context
    SV * timeout
PROTOTYPE: $$
CODE:
    uint64_t _timeout = 0;
    RETVAL = getdns_context_get_idle_timeout(context, &_timeout);
    timeout = newSVUInt64(_timeout);
OUTPUT:
    timeout
    RETVAL

getdns_return_t
getdns_context_get_follow_redirects(context, value)
    Net::GetDNS::XS::Context * context
    getdns_redirects_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_follow_redirects(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_dns_root_servers(context, addresses)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * addresses
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_dns_root_servers(context, &addresses);
OUTPUT:
    addresses
    RETVAL

getdns_return_t
getdns_context_get_append_name(context, value)
    Net::GetDNS::XS::Context * context
    getdns_append_name_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_append_name(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_suffix(context, value)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_suffix(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_dnssec_trust_anchors(context, value)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_dnssec_trust_anchors(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_dnssec_allowed_skew(context, value)
    Net::GetDNS::XS::Context * context
    uint32_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_dnssec_allowed_skew(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_upstream_recursive_servers(context, upstream_list)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * upstream_list
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_upstream_recursive_servers(context, &upstream_list);
OUTPUT:
    upstream_list
    RETVAL

getdns_return_t
getdns_context_get_edns_maximum_udp_payload_size(context, value)
    Net::GetDNS::XS::Context * context
    uint16_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_edns_maximum_udp_payload_size(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_edns_extended_rcode(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_edns_extended_rcode(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_edns_version(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_edns_version(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_edns_do_bit(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_edns_do_bit(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_edns_client_subnet_private(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_edns_client_subnet_private(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_tls_query_padding_blocksize(context, value)
    Net::GetDNS::XS::Context * context
    uint16_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_tls_query_padding_blocksize(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_tls_authentication(context, value)
    Net::GetDNS::XS::Context * context
    getdns_tls_authentication_t value
PROTOTYPE: $$
CODE:
    RETVAL = getdns_context_get_tls_authentication(context, &value);
OUTPUT:
    value
    RETVAL

uint32_t
getdns_context_get_num_pending_requests(context, next_timeout)
    Net::GetDNS::XS::Context * context
    SV * next_timeout
PROTOTYPE: $$
CODE:
    struct timeval _next_timeout = { 0, 0 };
	char string[256];
	STRLEN length;

    RETVAL = getdns_context_get_num_pending_requests(context, &_next_timeout);

	length = snprintf(string, sizeof(string), "%lu.%lu", _next_timeout.tv_sec, _next_timeout.tv_usec);
	if ( length > 0 || length < sizeof(string) ) {
	    next_timeout = newSVpv(string, length);
	}
OUTPUT:
    next_timeout
    RETVAL


MODULE = Net::GetDNS::XS::Context  PACKAGE = Net::GetDNS::XS::Context

PROTOTYPES: ENABLE
