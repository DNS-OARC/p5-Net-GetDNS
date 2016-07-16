#include "net_getdns.h"


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


MODULE = Net::GetDNS::XS::Context  PACKAGE = Net::GetDNS::XS::Context

PROTOTYPES: ENABLE
