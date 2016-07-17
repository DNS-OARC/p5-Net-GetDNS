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

MODULE = Net::GetDNS::XS::Dict  PACKAGE = Net::GetDNS::XS::Dict

PROTOTYPES: ENABLE
