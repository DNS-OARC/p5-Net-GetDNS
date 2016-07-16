#include "net_getdns.h"

MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS  PREFIX = net_getdns_xs_

PROTOTYPES: ENABLE

Net::GetDNS::XS*
net_getdns_xs_new(class)
    const char* class
PROTOTYPE: $
OUTPUT:
    RETVAL

MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XSPtr  PREFIX = net_getdns_xs_

PROTOTYPES: ENABLE

void
net_getdns_xs_DESTROY(object)
    Net::GetDNS::XS* object
PROTOTYPE: $

MODULE = Net::GetDNS  PACKAGE = Net::GetDNS  PREFIX = crypt_pkcs11_

PROTOTYPES: ENABLE

BOOT:
{
}
