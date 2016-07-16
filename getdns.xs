#include "net_getdns.h"


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS  PREFIX = getdns_

PROTOTYPES: ENABLE

const char *
getdns_get_version()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

const char *
getdns_get_api_version()
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
getdns_address(context, name, extensions, userarg, transaction_id, callbackfn)
    Net::GetDNS::XS::Context * context
    const char * name
    Net::GetDNS::XS::Dict * extensions
    SV * userarg
    getdns_transaction_t transaction_id
    SV * callbackfn
PROTOTYPE: $$$$$$
CODE:
    RETVAL = net_getdns_address(context, name, extensions, userarg, &transaction_id, callbackfn);
OUTPUT:
    transaction_id
    RETVAL

char *
getdns_pretty_print_dict(some_dict)
    Net::GetDNS::XS::Dict * some_dict
PROTOTYPE: $

void
getdns_context_run(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $


MODULE = Net::GetDNS  PACKAGE = Net::GetDNS  PREFIX = crypt_pkcs11_

PROTOTYPES: ENABLE

BOOT:
{
}
