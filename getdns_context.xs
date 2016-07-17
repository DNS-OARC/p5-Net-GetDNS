#include "net_getdns.h"
#include "compat_64bit.h"

#include <stdio.h>


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS

PROTOTYPES: ENABLE

getdns_return_t
getdns_context_create(context, set_from_os)
    Net::GetDNS::XS::Context * context = NO_INIT
    int set_from_os
PROTOTYPE: DISABLE
CODE:
    /* TODO: fail if context is set */
    RETVAL = getdns_context_create(&context, set_from_os);
OUTPUT:
    context
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
getdns_context_get_namespaces(context, namespaces)
    Net::GetDNS::XS::Context * context
    AV * namespaces
PROTOTYPE: $$
CODE:
    size_t namespace_count = 0;
    getdns_namespace_t * _namespaces = 0;

    RETVAL = getdns_context_get_namespaces(context, &namespace_count, &_namespaces);
    if (namespaces && !RETVAL) {
        size_t i;

        for (i = 0; i < namespace_count; i++) {
            av_push(namespaces, newSVuv(_namespaces[i]));
        }
    }
OUTPUT:
    namespaces
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
getdns_context_get_dns_transport_list(context, transports)
    Net::GetDNS::XS::Context * context
    AV * transports
PROTOTYPE: $$
CODE:
    size_t transport_count = 0;
    getdns_transport_list_t * _transports = 0;

    RETVAL = getdns_context_get_dns_transport_list(context, &transport_count, &_transports);
    if (transports && !RETVAL) {
        size_t i;

        for (i = 0; i < transport_count; i++) {
            av_push(transports, newSVuv(_transports[i]));
        }
    }
OUTPUT:
    transports
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
    Net::GetDNS::XS::List * addresses = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: check that addresses is not set */
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
    Net::GetDNS::XS::List * value = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: check that value is not set */
    RETVAL = getdns_context_get_suffix(context, &value);
OUTPUT:
    value
    RETVAL

getdns_return_t
getdns_context_get_dnssec_trust_anchors(context, value)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * value = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: check that value is not set */
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
    Net::GetDNS::XS::List * upstream_list = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: check that upstream_list is not set */
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
    SV * next_timeout = NO_INIT
PROTOTYPE: $$
CODE:
    struct timeval _next_timeout = { 0, 0 };
	char string[256];
	STRLEN length;

    RETVAL = getdns_context_get_num_pending_requests(context, &_next_timeout);

	length = snprintf(string, sizeof(string), "%lu.%lu", _next_timeout.tv_sec, _next_timeout.tv_usec);
	if ( length > 0 || length < sizeof(string) ) {
        /* TODO: Free next_timeout if set */
	    next_timeout = newSVpv(string, length);
	}
OUTPUT:
    next_timeout
    RETVAL

getdns_return_t
getdns_context_set_resolution_type(context, value)
    Net::GetDNS::XS::Context * context
    getdns_resolution_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_namespaces(context, namespaces)
    Net::GetDNS::XS::Context * context
    AV * namespaces
PROTOTYPE: $$
CODE:
    size_t namespace_count = 0;
    getdns_namespace_t * _namespaces = 0;
    size_t i;
    SV ** item;

    if (av_len(namespaces) < 0) {
        return GETDNS_RETURN_GENERIC_ERROR;
    }
    namespace_count = av_len(namespaces);
    Newxz(_namespaces, namespace_count, getdns_namespace_t);
    for (i = 0; i < namespace_count; i++) {
        item = av_fetch(namespaces, i, 0);
        if (!item || !*item) {
            Safefree(_namespaces);
            return GETDNS_RETURN_GENERIC_ERROR;
        }
        _namespaces[i] = SvUV(*item);
    }
    RETVAL = getdns_context_set_namespaces(context, namespace_count, _namespaces);
    Safefree(_namespaces);
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_dns_transport(context, value)
    Net::GetDNS::XS::Context * context
    getdns_transport_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_dns_transport_list(context, transports)
    Net::GetDNS::XS::Context * context
    AV * transports
PROTOTYPE: $$
CODE:
    size_t transport_count = 0;
    getdns_transport_list_t * _transports = 0;
    size_t i;
    SV ** item;

    if (av_len(transports) < 0) {
        return GETDNS_RETURN_GENERIC_ERROR;
    }
    transport_count = av_len(transports);
    Newxz(_transports, transport_count, getdns_transport_list_t);
    for (i = 0; i < transport_count; i++) {
        item = av_fetch(transports, i, 0);
        if (!item || !*item) {
            Safefree(_transports);
            return GETDNS_RETURN_GENERIC_ERROR;
        }
        _transports[i] = SvUV(*item);
    }
    RETVAL = getdns_context_set_dns_transport_list(context, transport_count, _transports);
    Safefree(_transports);
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_idle_timeout(context, timeout)
    Net::GetDNS::XS::Context * context
    SV * timeout
PROTOTYPE: $$
CODE:
    uint64_t _timeout = SvUInt64(timeout);
    RETVAL = getdns_context_set_idle_timeout(context, _timeout);
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_limit_outstanding_queries(context, limit)
    Net::GetDNS::XS::Context * context
    uint16_t limit
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_timeout(context, timeout)
    Net::GetDNS::XS::Context * context
    SV * timeout
PROTOTYPE: $$
CODE:
    uint64_t _timeout = SvUInt64(timeout);
    RETVAL = getdns_context_set_timeout(context, _timeout);
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_follow_redirects(context, value)
    Net::GetDNS::XS::Context * context
    getdns_redirects_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_dns_root_servers(context, addresses)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * addresses
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_append_name(context, value)
    Net::GetDNS::XS::Context * context
    getdns_append_name_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_suffix(context, value)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_dnssec_trust_anchors(context, value)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_dnssec_allowed_skew(context, value)
    Net::GetDNS::XS::Context * context
    uint32_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_upstream_recursive_servers(context, upstream_list)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::List * upstream_list
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_edns_maximum_udp_payload_size(context, value)
    Net::GetDNS::XS::Context * context
    uint16_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_edns_extended_rcode(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_edns_version(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_edns_do_bit(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_return_dnssec_status(context, enabled)
    Net::GetDNS::XS::Context * context
    int enabled
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_use_threads(context, use_threads)
    Net::GetDNS::XS::Context * context
    int use_threads
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_tls_authentication(context, value)
    Net::GetDNS::XS::Context * context
    getdns_tls_authentication_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_edns_client_subnet_private(context, value)
    Net::GetDNS::XS::Context * context
    uint8_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_context_set_tls_query_padding_blocksize(context, value)
    Net::GetDNS::XS::Context * context
    uint16_t value
PROTOTYPE: $$
OUTPUT:
    RETVAL

void
getdns_context_run(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $

getdns_return_t
getdns_context_process_async(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $
OUTPUT:
    RETVAL


MODULE = Net::GetDNS::XS::Context  PACKAGE = Net::GetDNS::XS::Context

PROTOTYPES: ENABLE
