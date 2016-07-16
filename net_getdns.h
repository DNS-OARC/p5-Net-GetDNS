#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

typedef struct net_getdns_xs_object Net__GetDNS__XS;

struct net_getdns_xs_object {
    void* handle;
};

Net__GetDNS__XS* net_getdns_xs_new(const char* class);

void net_getdns_xs_DESTROY(Net__GetDNS__XS* object);
