#include "net_getdns.h"


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

char *
getdns_pretty_print_dict(some_dict)
    Net::GetDNS::XS::Dict * some_dict
PROTOTYPE: $

void
getdns_context_run(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $

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


MODULE = Net::GetDNS  PACKAGE = Net::GetDNS

PROTOTYPES: ENABLE

BOOT:
{
}
