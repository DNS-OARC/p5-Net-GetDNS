#include "net_getdns.h"

#include <stdio.h>


MODULE = Net::GetDNS::XS::Bindata  PACKAGE = Net::GetDNS::XS::BindataPtr  PREFIX = getdns_bindata_

PROTOTYPES: ENABLE

void
getdns_bindata_DESTROY(object)
    Net::GetDNS::XS::Bindata * object
PROTOTYPE: $
CODE:
    if (object) {
        if (object->data) {
            Safefree(object->data);
        }
        Safefree(object);
    }

SV *
getdns_bindata_get(object)
    Net::GetDNS::XS::Bindata * object
PROTOTYPE: $
CODE:
    RETVAL = newSVpvn(object->data, object->size);
OUTPUT:
    RETVAL


MODULE = Net::GetDNS::XS::Bindata  PACKAGE = Net::GetDNS::XS::Bindata  PREFIX = getdns_bindata_

PROTOTYPES: ENABLE

Net::GetDNS::XS::Bindata *
getdns_bindata_new(class, data = 0)
    const char * class
    SV * data
PROTOTYPE: $
CODE:
    STRLEN len;
    char * svp;

    Newxz(RETVAL, 1, Net__GetDNS__XS__Bindata);

    if (RETVAL && data) {
        svp = SvPVbyte(data, len);
        if ( svp && len ) {
            Newx(RETVAL->data, len, uint8_t);
            if (RETVAL->data) {
                memcpy(RETVAL->data, svp, len);
                RETVAL->size = len;
            }
            else {
                Safefree(RETVAL);
                RETVAL = 0;
            }
        }
    }
OUTPUT:
    RETVAL
