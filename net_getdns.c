#include "net_getdns.h"

Net__GetDNS__XS* net_getdns_xs_new(const char* class) {
    Net__GetDNS__XS* object = 0;
    Newxz(object, 1, Net__GetDNS__XS);

    /* uncoverable branch 0 */
    if (!object) {
        /* uncoverable block 0 */
        croak("Memory allocation error");
    }

    return object;
}

void net_getdns_xs_DESTROY(Net__GetDNS__XS* object) {
    if (object) {
        Safefree(object);
    }
}
