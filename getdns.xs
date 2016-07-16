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


MODULE = Net::GetDNS  PACKAGE = Net::GetDNS  PREFIX = crypt_pkcs11_

PROTOTYPES: ENABLE

BOOT:
{
}
