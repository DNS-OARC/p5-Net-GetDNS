#include "net_getdns.h"

#include <stdio.h>

struct __callback {
    SV * userarg;
    SV * callbackfn;
};

void __getdns_callback(
    Net__GetDNS__XS__Context *context,
    getdns_callback_type_t callback_type,
    Net__GetDNS__XS__Dict * response,
    void *userarg,
    getdns_transaction_t transaction_id)
{
    dSP;
    struct __callback * cb;
    if (!userarg) return;
    cb = (struct __callback *)userarg;
    if (!cb->callbackfn) return;

    ENTER;
    SAVETMPS;
    PUSHMARK(SP);
    XPUSHs(sv_2mortal(sv_setref_pv(newSV(0), "Net::GetDNS::XS::ContextPtr", (void *)context)));
    XPUSHs(sv_2mortal(newSVuv(callback_type)));
    XPUSHs(sv_2mortal(sv_setref_pv(newSV(0), "Net::GetDNS::XS::DictPtr", (void *)response)));
    XPUSHs(sv_2mortal(newSVsv(cb->userarg)));
    XPUSHs(sv_2mortal(newSVuv(transaction_id)));
    PUTBACK;

    call_sv((SV*)(cb->callbackfn), G_VOID);

    FREETMPS;
    LEAVE;

    SvREFCNT_dec(cb->callbackfn);
    Safefree(cb);
}

getdns_return_t
net_getdns_address(
    Net__GetDNS__XS__Context * context,
    const char * name,
    Net__GetDNS__XS__Dict * extensions,
    SV * userarg,
    getdns_transaction_t * transaction_id,
    SV * callbackfn)
{
    struct __callback * cb = 0;

    Newx(cb, 1, struct __callback);
    if (!cb) return GETDNS_RETURN_MEMORY_ERROR;

    cb->userarg = userarg;
    SvGETMAGIC(callbackfn);
    cb->callbackfn = SvREFCNT_inc(newSVsv(callbackfn));

    return getdns_address(context, name, extensions, cb, transaction_id, __getdns_callback);
}
