#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <getdns/getdns.h>
#include <getdns/getdns_extra.h>

typedef getdns_dict Net__GetDNS__XS__Dict;
typedef getdns_context Net__GetDNS__XS__Context;
typedef getdns_list Net__GetDNS__XS__List;
typedef getdns_bindata Net__GetDNS__XS__Bindata;

getdns_return_t
net_getdns_address(
    Net__GetDNS__XS__Context * context,
    const char * name,
    Net__GetDNS__XS__Dict * extensions,
    SV * userarg,
    getdns_transaction_t * transaction_id,
    SV * callbackfn);
