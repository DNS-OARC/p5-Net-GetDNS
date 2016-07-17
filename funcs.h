//getdns_list *getdns_list_create();
//getdns_list *getdns_list_create_with_context(getdns_context *context);
getdns_list *getdns_list_create_with_memory_functions( void *(*malloc) (size_t), void *(*realloc) (void *, size_t), void (*free) (void *) );
getdns_list *getdns_list_create_with_extended_memory_functions( void *userarg, void *(*malloc) (void *userarg, size_t), void *(*realloc) (void *userarg, void *, size_t), void (*free) (void *userarg, void *) );
//void getdns_list_destroy(getdns_list *list);

//getdns_return_t getdns_list_get_length(const getdns_list *list, size_t * answer);
//getdns_return_t getdns_list_get_data_type(const getdns_list *list, size_t index, getdns_data_type * answer);
//getdns_return_t getdns_list_get_dict(const getdns_list *list, size_t index, getdns_dict **answer);
//getdns_return_t getdns_list_get_list(const getdns_list *list, size_t index, getdns_list **answer);
//getdns_return_t getdns_list_get_bindata(const getdns_list *list, size_t index, getdns_bindata **answer);
//getdns_return_t getdns_list_get_int(const getdns_list *list, size_t index, uint32_t * answer);

//getdns_return_t getdns_list_set_dict(getdns_list *list, size_t index, const getdns_dict *child_dict);
//getdns_return_t getdns_list_set_list(getdns_list *list, size_t index, const getdns_list *child_list);
//getdns_return_t getdns_list_set_bindata(getdns_list *list, size_t index, const getdns_bindata *child_bindata);
//getdns_return_t getdns_list_set_int(getdns_list *list, size_t index, uint32_t child_uint32);


//getdns_dict *getdns_dict_create();
//getdns_dict *getdns_dict_create_with_context(getdns_context *context);
getdns_dict *getdns_dict_create_with_memory_functions( void *(*malloc) (size_t), void *(*realloc) (void *, size_t), void (*free) (void *) );
getdns_dict *getdns_dict_create_with_extended_memory_functions( void *userarg, void *(*malloc) (void *userarg, size_t), void *(*realloc) (void *userarg, void *, size_t), void (*free) (void *userarg, void *) );
//void getdns_dict_destroy(getdns_dict *dict);

//getdns_return_t getdns_dict_get_names(const getdns_dict *dict, getdns_list **answer);
//getdns_return_t getdns_dict_get_data_type(const getdns_dict *dict, const char *name, getdns_data_type * answer);
//getdns_return_t getdns_dict_get_dict(const getdns_dict *dict, const char *name, getdns_dict **answer);
//getdns_return_t getdns_dict_get_list(const getdns_dict *dict, const char *name, getdns_list **answer);
//getdns_return_t getdns_dict_get_bindata(const getdns_dict *dict, const char *name, getdns_bindata **answer);
//getdns_return_t getdns_dict_get_int(const getdns_dict *dict, const char *name, uint32_t * answer);

//getdns_return_t getdns_dict_set_dict(getdns_dict *dict, const char *name, const getdns_dict *child_dict);
//getdns_return_t getdns_dict_set_list(getdns_dict *dict, const char *name, const getdns_list *child_list);
//getdns_return_t getdns_dict_set_bindata(getdns_dict *dict, const char *name, const getdns_bindata *child_bindata);
//getdns_return_t getdns_dict_set_int(getdns_dict *dict, const char *name, uint32_t child_uint32);
//getdns_return_t getdns_dict_remove_name(getdns_dict *dict, const char *name);


//getdns_return_t getdns_context_create(getdns_context ** context, int set_from_os);
getdns_return_t getdns_context_create_with_memory_functions( getdns_context ** context, int set_from_os, void *(*malloc) (size_t), void *(*realloc) (void *, size_t), void (*free) (void *) );
getdns_return_t getdns_context_create_with_extended_memory_functions( getdns_context **context, int set_from_os, void *userarg, void *(*malloc) (void *userarg, size_t), void *(*realloc) (void *userarg, void *, size_t), void (*free) (void *userarg, void *) );
//void getdns_context_destroy(getdns_context *context);

//getdns_dict* getdns_context_get_api_information(getdns_context* context);
//getdns_return_t getdns_context_get_resolution_type(getdns_context *context, getdns_resolution_t* value);
getdns_return_t getdns_context_get_namespaces(getdns_context *context, size_t* namespace_count, getdns_namespace_t **namespaces);
//getdns_return_t getdns_context_get_dns_transport(getdns_context *context, getdns_transport_t* value);
getdns_return_t getdns_context_get_dns_transport_list(getdns_context *context, size_t* transport_count, getdns_transport_list_t **transports);
//getdns_return_t getdns_context_get_limit_outstanding_queries(getdns_context *context, uint16_t* limit);
//getdns_return_t getdns_context_get_timeout(getdns_context *context, uint64_t* timeout);
//getdns_return_t getdns_context_get_idle_timeout(getdns_context *context, uint64_t* timeout);
//getdns_return_t getdns_context_get_follow_redirects(getdns_context *context, getdns_redirects_t* value);
//getdns_return_t getdns_context_get_dns_root_servers(getdns_context *context, getdns_list **addresses);
//getdns_return_t getdns_context_get_append_name(getdns_context *context, getdns_append_name_t* value);
//getdns_return_t getdns_context_get_suffix(getdns_context *context, getdns_list **value);
//getdns_return_t getdns_context_get_dnssec_trust_anchors(getdns_context *context, getdns_list **value);
//getdns_return_t getdns_context_get_dnssec_allowed_skew(getdns_context *context, uint32_t* value);
//getdns_return_t getdns_context_get_upstream_recursive_servers(getdns_context *context, getdns_list **upstream_list);
//getdns_return_t getdns_context_get_edns_maximum_udp_payload_size(getdns_context *context, uint16_t* value);
//getdns_return_t getdns_context_get_edns_extended_rcode(getdns_context *context, uint8_t* value);
//getdns_return_t getdns_context_get_edns_version(getdns_context *context, uint8_t* value);
//getdns_return_t getdns_context_get_edns_do_bit(getdns_context *context, uint8_t* value);
//getdns_return_t getdns_context_get_edns_client_subnet_private(getdns_context *context, uint8_t* value);
//getdns_return_t getdns_context_get_tls_query_padding_blocksize(getdns_context *context, uint16_t* value);
//getdns_return_t getdns_context_get_tls_authentication(getdns_context *context, getdns_tls_authentication_t* value);
getdns_return_t getdns_context_get_update_callback(getdns_context *context, void **userarg, void (**value) (getdns_context *, getdns_context_code_t, void *));
//uint32_t getdns_context_get_num_pending_requests(getdns_context* context, struct timeval* next_timeout);

getdns_return_t getdns_context_set_context_update_callback( getdns_context *context, void (*value)(getdns_context *context, getdns_context_code_t changed_item) );
//getdns_return_t getdns_context_set_resolution_type(getdns_context *context, getdns_resolution_t value);
getdns_return_t getdns_context_set_namespaces(getdns_context *context, size_t namespace_count, getdns_namespace_t *namespaces);
//getdns_return_t getdns_context_set_dns_transport(getdns_context *context, getdns_transport_t value);
getdns_return_t getdns_context_set_dns_transport_list(getdns_context *context, size_t transport_count, getdns_transport_list_t *transports);
//getdns_return_t getdns_context_set_idle_timeout(getdns_context *context, uint64_t timeout);
//getdns_return_t getdns_context_set_limit_outstanding_queries(getdns_context *context, uint16_t limit);
//getdns_return_t getdns_context_set_timeout(getdns_context *context, uint64_t timeout);
//getdns_return_t getdns_context_set_follow_redirects(getdns_context *context, getdns_redirects_t value);
//getdns_return_t getdns_context_set_dns_root_servers(getdns_context *context, getdns_list *addresses);
//getdns_return_t getdns_context_set_append_name(getdns_context *context, getdns_append_name_t value);
//getdns_return_t getdns_context_set_suffix(getdns_context *context, getdns_list *value);
//getdns_return_t getdns_context_set_dnssec_trust_anchors(getdns_context *context, getdns_list *value);
//getdns_return_t getdns_context_set_dnssec_allowed_skew(getdns_context *context, uint32_t value);
//getdns_return_t getdns_context_set_upstream_recursive_servers(getdns_context *context, getdns_list *upstream_list);
//getdns_return_t getdns_context_set_edns_maximum_udp_payload_size(getdns_context *context, uint16_t value);
//getdns_return_t getdns_context_set_edns_extended_rcode(getdns_context *context, uint8_t value);
//getdns_return_t getdns_context_set_edns_version(getdns_context *context, uint8_t value);
//getdns_return_t getdns_context_set_edns_do_bit(getdns_context *context, uint8_t value);
getdns_return_t getdns_context_set_memory_functions(getdns_context *context, void *(*malloc) (size_t), void *(*realloc) (void *, size_t), void (*free) (void *) );
getdns_return_t getdns_context_set_extended_memory_functions(getdns_context *context, void *userarg, void *(*malloc) (void *userarg, size_t sz), void *(*realloc) (void *userarg, void *ptr, size_t sz), void (*free) (void *userarg, void *ptr) );
getdns_return_t getdns_context_set_update_callback(getdns_context *context, void *userarg, void (*value) (getdns_context *, getdns_context_code_t, void *));
//getdns_return_t getdns_context_set_return_dnssec_status( getdns_context *context, int enabled);
//getdns_return_t getdns_context_set_use_threads(getdns_context* context, int use_threads);
//getdns_return_t getdns_context_set_tls_authentication( getdns_context *context, getdns_tls_authentication_t value);
//getdns_return_t getdns_context_set_edns_client_subnet_private(getdns_context *context, uint8_t value);
//getdns_return_t getdns_context_set_tls_query_padding_blocksize(getdns_context *context, uint16_t value);


//getdns_return_t getdns_general(getdns_context *context, const char *name, uint16_t request_type, getdns_dict *extensions, void *userarg, getdns_transaction_t * transaction_id, getdns_callback_t callbackfn);
//getdns_return_t getdns_address(getdns_context *context, const char *name, getdns_dict *extensions, void *userarg, getdns_transaction_t * transaction_id, getdns_callback_t callbackfn);
//getdns_return_t getdns_hostname(getdns_context *context, getdns_dict *address, getdns_dict *extensions, void *userarg, getdns_transaction_t * transaction_id, getdns_callback_t callbackfn);
//getdns_return_t getdns_service(getdns_context *context, const char *name, getdns_dict *extensions, void *userarg, getdns_transaction_t * transaction_id, getdns_callback_t callbackfn);
//getdns_return_t getdns_cancel_callback(getdns_context *context, getdns_transaction_t transaction_id);
//getdns_return_t getdns_general_sync(getdns_context *context, const char *name, uint16_t request_type, getdns_dict *extensions, getdns_dict **response);
//getdns_return_t getdns_address_sync(getdns_context *context, const char *name, getdns_dict *extensions, getdns_dict **response);
//getdns_return_t getdns_hostname_sync(getdns_context *context, getdns_dict *address, getdns_dict *extensions, getdns_dict **response);
//getdns_return_t getdns_service_sync(getdns_context *context, const char *name, getdns_dict *extensions, getdns_dict **response);


//getdns_return_t getdns_convert_dns_name_to_fqdn( const getdns_bindata *dns_name_wire_fmt, char **fqdn_as_string);
//getdns_return_t getdns_convert_fqdn_to_dns_name( const char *fqdn_as_string, getdns_bindata **dns_name_wire_fmt);
//char *getdns_convert_ulabel_to_alabel(const char *ulabel);
//char *getdns_convert_alabel_to_ulabel(const char *alabel);
//getdns_return_t getdns_validate_dnssec(getdns_list *to_validate, getdns_list *support_records, getdns_list *trust_anchors);
//getdns_list *getdns_root_trust_anchor(time_t *utc_date_of_anchor);
//char *getdns_pretty_print_dict(const getdns_dict *some_dict);
//char *getdns_display_ip_address(const getdns_bindata *bindata_of_ipv4_or_ipv6_address);


getdns_return_t getdns_context_set_eventloop(getdns_context* context, getdns_eventloop *eventloop);
getdns_return_t getdns_context_get_eventloop(getdns_context* context, getdns_eventloop **eventloop);
getdns_return_t getdns_context_detach_eventloop(getdns_context *context);
//void getdns_context_run(getdns_context *context);
//getdns_return_t getdns_context_process_async(getdns_context* context);


//const char *getdns_get_version(void);
//uint32_t getdns_get_version_number(void);
//const char *getdns_get_api_version(void);
//uint32_t getdns_get_api_version_number(void);


//const char *getdns_get_errorstr_by_id(uint16_t err);
//getdns_return_t getdns_strerror(getdns_return_t err, char *buf, size_t buflen);


//getdns_return_t getdns_dict_util_set_string(struct getdns_dict * dict, char *name, const char *value);
//getdns_return_t getdns_dict_util_get_string(struct getdns_dict * dict, char *name, char **result);


//getdns_return_t getdns_validate_dnssec2(getdns_list *to_validate, getdns_list *support_records, getdns_list *trust_anchors, time_t validation_time, uint32_t skew);


//getdns_dict* getdns_pubkey_pin_create_from_string( 	getdns_context* context, 	const char* str);
//getdns_return_t getdns_pubkey_pinset_sanity_check( 	const getdns_list* pinset, 	getdns_list* errorlist);


//int getdns_pretty_snprint_dict(char *str, size_t size, const getdns_dict *dict);
//char * getdns_pretty_print_list(const getdns_list *some_list);
//int getdns_pretty_snprint_list(char *str, size_t size, const getdns_list *list);
//char * getdns_print_json_dict(const getdns_dict *some_dict, int pretty);
//int getdns_snprint_json_dict( char *str, size_t size, const getdns_dict *dict, int pretty);
//char * getdns_print_json_list(const getdns_list *some_list, int pretty);
//int getdns_snprint_json_list( char *str, size_t size, const getdns_list *list, int pretty);


getdns_return_t getdns_rr_dict2wire( const getdns_dict *rr_dict, uint8_t **wire, size_t *wire_sz);
getdns_return_t getdns_rr_dict2wire_buf( const getdns_dict *rr_dict, uint8_t *wire, size_t *wire_sz);
getdns_return_t getdns_rr_dict2wire_scan( const getdns_dict *rr_dict, uint8_t **wire, int *wire_sz);
getdns_return_t getdns_wire2rr_dict( const uint8_t *wire, size_t wire_sz, getdns_dict **rr_dict);
getdns_return_t getdns_wire2rr_dict_buf( const uint8_t *wire, size_t *wire_sz, getdns_dict **rr_dict);
getdns_return_t getdns_wire2rr_dict_scan( const uint8_t **wire, size_t *wire_sz, getdns_dict **rr_dict);
getdns_return_t getdns_rr_dict2str( const getdns_dict *rr_dict, char **str);
getdns_return_t getdns_rr_dict2str_buf( const getdns_dict *rr_dict, char *str, size_t *str_len);
getdns_return_t getdns_rr_dict2str_scan( const getdns_dict *rr_dict, char **str, int *str_len);
getdns_return_t getdns_str2rr_dict( const char *str, getdns_dict **rr_dict, const char *origin, uint32_t default_ttl);
getdns_return_t getdns_fp2rr_list( FILE *in, getdns_list **rr_list, const char *origin, uint32_t default_ttl);
getdns_return_t getdns_msg_dict2wire( const getdns_dict *msg_dict, uint8_t **wire, size_t *wire_sz);
getdns_return_t getdns_msg_dict2wire_buf( const getdns_dict *msg_dict, uint8_t *wire, size_t *wire_sz);
getdns_return_t getdns_msg_dict2wire_scan( const getdns_dict *msg_dict, uint8_t **wire, int *wire_sz);
getdns_return_t getdns_wire2msg_dict( const uint8_t *wire, size_t wire_sz, getdns_dict **msg_dict);
getdns_return_t getdns_wire2msg_dict_buf( const uint8_t *wire, size_t *wire_sz, getdns_dict **msg_dict);
getdns_return_t getdns_wire2msg_dict_scan( const uint8_t **wire, size_t *wire_sz, getdns_dict **msg_dict);
getdns_return_t getdns_msg_dict2str( const getdns_dict *msg_dict, char **str);
getdns_return_t getdns_msg_dict2str_buf( const getdns_dict *msg_dict, char *str, size_t *str_len);
getdns_return_t getdns_msg_dict2str_scan( const getdns_dict *msg_dict, char **str, int *str_len);
