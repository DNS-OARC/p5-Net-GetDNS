#include "net_getdns.h"


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS

PROTOTYPES: ENABLE

Net::GetDNS::XS::List *
getdns_list_create()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

Net::GetDNS::XS::List *
getdns_list_create_with_context(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $
OUTPUT:
    RETVAL

void
getdns_list_destroy(list)
    Net::GetDNS::XS::List * list
PROTOTYPE: $

getdns_return_t
getdns_list_get_length(list, answer)
    Net::GetDNS::XS::List * list
    size_t answer
PROTOTYPE: $$
CODE:
    RETVAL = getdns_list_get_length(list, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_list_get_data_type(list, index, answer)
    Net::GetDNS::XS::List * list
    size_t index
    getdns_data_type answer
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_get_data_type(list, index, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_list_get_dict(list, index, answer)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::Dict * answer = NO_INIT
PROTOTYPE: $$$
CODE:
    /* TODO: Free answer if set */
    RETVAL = getdns_list_get_dict(list, index, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_list_get_list(list, index, answer)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::List * answer = NO_INIT
PROTOTYPE: $$$
CODE:
    /* TODO: Free answer if set */
    RETVAL = getdns_list_get_list(list, index, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_list_get_bindata(list, index, answer)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::Bindata * answer
PROTOTYPE: $$$
CODE:
    getdns_bindata * bindata = 0;
    RETVAL = getdns_list_get_bindata(list, index, &answer);
    if (bindata && bindata->data && bindata->size) {
        if (answer->data) Safefree(answer->data);
        answer->size = 0;
        Newxz(answer->data, bindata->size, uint8_t);
        if (answer->data) {
            memcpy(answer->data, bindata->data, bindata->size);
            answer->size = bindata->size;
        }
    }
OUTPUT:
    RETVAL

getdns_return_t
getdns_list_get_int(list, index, answer)
    Net::GetDNS::XS::List * list
    size_t index
    uint32_t answer
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_get_int(list, index, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_list_set_dict(list, index, child_dict)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::Dict * child_dict
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_set_dict(list, index, child_dict);
OUTPUT:
    RETVAL

getdns_return_t
getdns_list_set_list(list, index, child_list)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::List * child_list
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_set_list(list, index, child_list);
OUTPUT:
    RETVAL

getdns_return_t
getdns_list_set_bindata(list, index, child_bindata)
    Net::GetDNS::XS::List * list
    size_t index
    Net::GetDNS::XS::Bindata * child_bindata
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_set_bindata(list, index, child_bindata);
OUTPUT:
    RETVAL

getdns_return_t
getdns_list_set_int(list, index, child_uint32)
    Net::GetDNS::XS::List * list
    size_t index
    uint32_t child_uint32
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_list_set_int(list, index, child_uint32);
OUTPUT:
    RETVAL

char *
getdns_pretty_print_list(some_list)
    Net::GetDNS::XS::List * some_list
PROTOTYPE: $
OUTPUT:
    RETVAL

int
getdns_pretty_snprint_list(str, list)
    SV * str
    Net::GetDNS::XS::List * list
PROTOTYPE: $$
CODE:
    char buf[4096];
    memset(buf, 0, sizeof(buf));
    RETVAL = getdns_pretty_snprint_list(buf, sizeof(buf)-1, list);
    sv_setpv_mg(str, buf);
OUTPUT:
    str
    RETVAL

char *
getdns_print_json_list(some_list, pretty)
    Net::GetDNS::XS::List * some_list
    int pretty
PROTOTYPE: $$
OUTPUT:
    RETVAL

int
getdns_snprint_json_list(str, list, pretty)
    SV * str
    Net::GetDNS::XS::List * list
    int pretty
PROTOTYPE: $$
CODE:
    char buf[4096];
    memset(buf, 0, sizeof(buf));
    RETVAL = getdns_snprint_json_list(buf, sizeof(buf)-1, list, pretty);
    sv_setpv_mg(str, buf);
OUTPUT:
    str
    RETVAL


MODULE = Net::GetDNS::XS::List  PACKAGE = Net::GetDNS::XS::List

PROTOTYPES: ENABLE
