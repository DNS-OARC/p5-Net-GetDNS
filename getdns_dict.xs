#include "net_getdns.h"


MODULE = Net::GetDNS::XS  PACKAGE = Net::GetDNS::XS

PROTOTYPES: ENABLE

Net::GetDNS::XS::Dict *
getdns_dict_create()
PROTOTYPE: DISABLE
OUTPUT:
    RETVAL

Net::GetDNS::XS::Dict *
getdns_dict_create_with_context(context)
    Net::GetDNS::XS::Context * context
PROTOTYPE: $
OUTPUT:
    RETVAL

void
getdns_dict_destroy(dict)
    Net::GetDNS::XS::Dict * dict
PROTOTYPE: $

getdns_return_t
getdns_dict_get_names(dict, answer)
    Net::GetDNS::XS::Dict * dict
    Net::GetDNS::XS::List * answer = NO_INIT
PROTOTYPE: $$
CODE:
    /* TODO: Free answer if set */
    RETVAL = getdns_dict_get_names(dict, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_dict_get_data_type(dict, name, answer)
    Net::GetDNS::XS::Dict * dict
    char * name
    getdns_data_type answer
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_get_data_type(dict, name, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_dict_get_dict(dict, name, answer)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::Dict * answer = NO_INIT
PROTOTYPE: $$$
CODE:
    /* TODO: Free answer if set */
    RETVAL = getdns_dict_get_dict(dict, name, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_dict_get_list(dict, name, answer)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::List * answer = NO_INIT
PROTOTYPE: $$$
CODE:
    /* TODO: Free answer if set */
    RETVAL = getdns_dict_get_list(dict, name, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_dict_get_bindata(dict, name, answer)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::Bindata * answer
PROTOTYPE: $$$
CODE:
    getdns_bindata * bindata = 0;
    RETVAL = getdns_dict_get_bindata(dict, name, &bindata);
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
getdns_dict_get_int(dict, name, answer)
    Net::GetDNS::XS::Dict * dict
    char * name
    uint32_t answer
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_get_int(dict, name, &answer);
OUTPUT:
    answer
    RETVAL

getdns_return_t
getdns_dict_set_dict(dict, name, child_dict)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::Dict * child_dict
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_set_dict(dict, name, child_dict);
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_set_list(dict, name, child_list)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::List * child_list
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_set_list(dict, name, child_list);
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_set_bindata(dict, name, child_bindata)
    Net::GetDNS::XS::Dict * dict
    char * name
    Net::GetDNS::XS::Bindata * child_bindata
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_set_bindata(dict, name, child_bindata);
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_set_int(dict, name, child_uint32)
    Net::GetDNS::XS::Dict * dict
    char * name
    uint32_t child_uint32
PROTOTYPE: $$$
CODE:
    RETVAL = getdns_dict_set_int(dict, name, child_uint32);
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_remove_name(dict, name)
    Net::GetDNS::XS::Dict * dict
    char * name
PROTOTYPE: $$
CODE:
    RETVAL = getdns_dict_remove_name(dict, name);
OUTPUT:
    RETVAL

char *
getdns_pretty_print_dict(some_dict)
    Net::GetDNS::XS::Dict * some_dict
PROTOTYPE: $
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_util_set_string(dict, name, value)
    Net::GetDNS::XS::Dict * dict
    char * name
    const char * value
PROTOTYPE: $$$
OUTPUT:
    RETVAL

getdns_return_t
getdns_dict_util_get_string(dict, name, result)
    Net::GetDNS::XS::Dict * dict
    char * name
    char * result = NO_INIT
PROTOTYPE: $$$
CODE:
    /* TODO: Check that result is not set */
    RETVAL = getdns_dict_util_get_string(dict, name, &result);
OUTPUT:
    result
    RETVAL

int
getdns_pretty_snprint_dict(str, dict)
    SV * str
    Net::GetDNS::XS::Dict * dict
PROTOTYPE: $$
CODE:
    char buf[4096];
    memset(buf, 0, sizeof(buf));
    RETVAL = getdns_pretty_snprint_dict(buf, sizeof(buf)-1, dict);
    sv_setpv_mg(str, buf);
OUTPUT:
    str
    RETVAL

char *
getdns_print_json_dict(some_dict, pretty)
    Net::GetDNS::XS::Dict * some_dict
    int pretty
PROTOTYPE: $$
OUTPUT:
    RETVAL

int
getdns_snprint_json_dict(str, dict, pretty)
    SV * str
    Net::GetDNS::XS::Dict * dict
    int pretty
PROTOTYPE: $$
CODE:
    char buf[4096];
    memset(buf, 0, sizeof(buf));
    RETVAL = getdns_snprint_json_dict(buf, sizeof(buf)-1, dict, pretty);
    sv_setpv_mg(str, buf);
OUTPUT:
    str
    RETVAL


MODULE = Net::GetDNS::XS::Dict  PACKAGE = Net::GetDNS::XS::Dict

PROTOTYPES: ENABLE
