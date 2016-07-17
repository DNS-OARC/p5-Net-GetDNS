#include "net_getdns.h"

#include <string.h>


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS

PROTOTYPES: ENABLE

getdns_return_t
getdns_general(context, name, request_type, extensions, userarg, transaction_id, callbackfn)
    Net::GetDNS::XS::Context * context
    const char * name
    uint16_t request_type
    Net::GetDNS::XS::Dict * extensions
    SV * userarg
    SV * transaction_id
    SV * callbackfn
PROTOTYPE: $$$$$$
CODE:
    getdns_transaction_t _transaction_id = 0;
    getdns_transaction_t * __transaction_id = 0;

    if (transaction_id && SvOK(transaction_id)) {
        SvGETMAGIC(transaction_id);
        _transaction_id = SvUV(transaction_id);
        __transaction_id = &_transaction_id;
    }

    RETVAL = net_getdns_general(context, name, request_type, extensions, userarg, __transaction_id, callbackfn);

    if (transaction_id && SvOK(transaction_id)) {
        sv_setuv(transaction_id, _transaction_id);
        SvSETMAGIC(transaction_id);
    }
OUTPUT:
    transaction_id
    RETVAL

getdns_return_t
getdns_address(context, name, extensions, userarg, transaction_id, callbackfn)
    Net::GetDNS::XS::Context * context
    const char * name
    Net::GetDNS::XS::Dict * extensions
    SV * userarg
    SV * transaction_id
    SV * callbackfn
PROTOTYPE: $$$$$$
CODE:
    getdns_transaction_t _transaction_id = 0;
    getdns_transaction_t * __transaction_id = 0;

    if (transaction_id && SvOK(transaction_id)) {
        SvGETMAGIC(transaction_id);
        _transaction_id = SvUV(transaction_id);
        __transaction_id = &_transaction_id;
    }

    RETVAL = net_getdns_address(context, name, extensions, userarg, __transaction_id, callbackfn);

    if (transaction_id && SvOK(transaction_id)) {
        sv_setuv(transaction_id, _transaction_id);
        SvSETMAGIC(transaction_id);
    }
OUTPUT:
    transaction_id
    RETVAL

getdns_return_t
getdns_hostname(context, address, extensions, userarg, transaction_id, callbackfn)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::Dict * address
    Net::GetDNS::XS::Dict * extensions
    SV * userarg
    SV * transaction_id
    SV * callbackfn
PROTOTYPE: $$$$$$
CODE:
    getdns_transaction_t _transaction_id = 0;
    getdns_transaction_t * __transaction_id = 0;

    if (transaction_id && SvOK(transaction_id)) {
        SvGETMAGIC(transaction_id);
        _transaction_id = SvUV(transaction_id);
        __transaction_id = &_transaction_id;
    }

    RETVAL = net_getdns_hostname(context, address, extensions, userarg, __transaction_id, callbackfn);

    if (transaction_id && SvOK(transaction_id)) {
        sv_setuv(transaction_id, _transaction_id);
        SvSETMAGIC(transaction_id);
    }
OUTPUT:
    transaction_id
    RETVAL

getdns_return_t
getdns_service(context, name, extensions, userarg, transaction_id, callbackfn)
    Net::GetDNS::XS::Context * context
    const char * name
    Net::GetDNS::XS::Dict * extensions
    SV * userarg
    SV * transaction_id
    SV * callbackfn
PROTOTYPE: $$$$$$
CODE:
    getdns_transaction_t _transaction_id = 0;
    getdns_transaction_t * __transaction_id = 0;

    if (transaction_id && SvOK(transaction_id)) {
        SvGETMAGIC(transaction_id);
        _transaction_id = SvUV(transaction_id);
        __transaction_id = &_transaction_id;
    }

    RETVAL = net_getdns_service(context, name, extensions, userarg, __transaction_id, callbackfn);

    if (transaction_id && SvOK(transaction_id)) {
        sv_setuv(transaction_id, _transaction_id);
        SvSETMAGIC(transaction_id);
    }
OUTPUT:
    transaction_id
    RETVAL

getdns_return_t
getdns_cancel_callback(context, transaction_id)
    Net::GetDNS::XS::Context * context
    getdns_transaction_t transaction_id
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_general_sync(context, name, request_type, extensions, response)
    Net::GetDNS::XS::Context * context
    const char * name
    uint16_t request_type
    Net::GetDNS::XS::Dict * extensions
    Net::GetDNS::XS::Dict * response = NO_INIT
PROTOTYPE: $$$$$
CODE:
    /* TODO: check that response is not set */
    RETVAL = getdns_general_sync(context, name, request_type, extensions, &response);
OUTPUT:
    response
    RETVAL

getdns_return_t
getdns_address_sync(context, name, extensions, response)
    Net::GetDNS::XS::Context * context
    const char * name
    Net::GetDNS::XS::Dict * extensions
    Net::GetDNS::XS::Dict * response = NO_INIT
PROTOTYPE: $$$$
CODE:
    /* TODO: check that response is not set */
    RETVAL = getdns_address_sync(context, name, extensions, &response);
OUTPUT:
    response
    RETVAL

getdns_return_t
getdns_hostname_sync(context, address, extensions, response)
    Net::GetDNS::XS::Context * context
    Net::GetDNS::XS::Dict * address
    Net::GetDNS::XS::Dict * extensions
    Net::GetDNS::XS::Dict * response = NO_INIT
PROTOTYPE: $$$$
CODE:
    /* TODO: check that response is not set */
    RETVAL = getdns_hostname_sync(context, address, extensions, &response);
OUTPUT:
    response
    RETVAL

getdns_return_t
getdns_service_sync(context, name, extensions, response)
    Net::GetDNS::XS::Context * context
    const char * name
    Net::GetDNS::XS::Dict * extensions
    Net::GetDNS::XS::Dict * response = NO_INIT
PROTOTYPE: $$$$
CODE:
    /* TODO: check that response is not set */
    RETVAL = getdns_service_sync(context, name, extensions, &response);
OUTPUT:
    response
    RETVAL

getdns_return_t
getdns_convert_dns_name_to_fqdn(dns_name_wire_fmt, fqdn_as_string)
    Net::GetDNS::XS::Bindata * dns_name_wire_fmt
    char * fqdn_as_string = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: Free fqdn_as_string if set */
    RETVAL = getdns_convert_dns_name_to_fqdn(dns_name_wire_fmt, &fqdn_as_string);
OUTPUT:
    fqdn_as_string
    RETVAL

getdns_return_t
getdns_convert_fqdn_to_dns_name(fqdn_as_string, dns_name_wire_fmt)
    const char * fqdn_as_string
    Net::GetDNS::XS::Bindata * dns_name_wire_fmt = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: Free dns_name_wire_fmt if set */
    RETVAL = getdns_convert_fqdn_to_dns_name(fqdn_as_string, &dns_name_wire_fmt);
OUTPUT:
    dns_name_wire_fmt
    RETVAL

char *
getdns_convert_ulabel_to_alabel(ulabel)
    const char * ulabel
PROTOTYPE: $
OUTPUT:
    RETVAL

char *
getdns_convert_alabel_to_ulabel(alabel)
    const char * alabel
PROTOTYPE: $
OUTPUT:
    RETVAL

getdns_return_t
getdns_validate_dnssec(to_validate, support_records, trust_anchors)
    Net::GetDNS::XS::List * to_validate
    Net::GetDNS::XS::List * support_records
    Net::GetDNS::XS::List * trust_anchors
PROTOTYPE: $$$
OUTPUT:
    RETVAL

Net::GetDNS::XS::List *
getdns_root_trust_anchor(utc_date_of_anchor)
    time_t utc_date_of_anchor
PROTOTYPE: $
CODE:
    RETVAL = getdns_root_trust_anchor(&utc_date_of_anchor);
OUTPUT:
    utc_date_of_anchor
    RETVAL

char *
getdns_display_ip_address(bindata_of_ipv4_or_ipv6_address)
    Net::GetDNS::XS::Bindata * bindata_of_ipv4_or_ipv6_address
PROTOTYPE: $
OUTPUT:
    RETVAL

const char *
getdns_get_version()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

uint32_t
getdns_get_version_number()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

const char *
getdns_get_api_version()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

uint32_t
getdns_get_api_version_number()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

const char *
getdns_get_errorstr_by_id(err)
    uint16_t err
PROTOTYPE: $
OUTPUT:
    RETVAL

getdns_return_t
getdns_strerror(err, str)
    getdns_return_t err
    SV * str
PROTOTYPE: $$
CODE:
    char buf[4096];
    SvGETMAGIC(str);
    memset(buf, 0, sizeof(buf));
    RETVAL = getdns_strerror(err, buf, sizeof(buf)-1);
    sv_setpv_mg(str, buf);
OUTPUT:
    str
    RETVAL

getdns_return_t
getdns_validate_dnssec2(to_validate, support_records, trust_anchors, validation_time, skew)
    Net::GetDNS::XS::List * to_validate
    Net::GetDNS::XS::List * support_records
    Net::GetDNS::XS::List * trust_anchors
    time_t validation_time
    uint32_t skew
PROTOTYPE: $$$$$
OUTPUT:
    RETVAL

Net::GetDNS::XS::Dict *
getdns_pubkey_pin_create_from_string(context, str)
    Net::GetDNS::XS::Context * context
    const char * str
PROTOTYPE: $$
OUTPUT:
    RETVAL

getdns_return_t
getdns_pubkey_pinset_sanity_check(pinset, errorlist)
    Net::GetDNS::XS::List * pinset
    Net::GetDNS::XS::List * errorlist
PROTOTYPE: $$
OUTPUT:
    RETVAL


MODULE = Net::GetDNS  PACKAGE = Net::GetDNS

PROTOTYPES: ENABLE

BOOT:
{
}
