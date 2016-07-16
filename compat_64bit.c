#include "net_getdns.h"
#include "compat_64bit.h"

#include <stdlib.h>

uint64_t SvUInt64(SV *sv) {
	return strtoull(SvPV_nolen (sv), NULL, 10);
}

SV * newSVUInt64(uint64_t value) {
	char string[256];
	STRLEN length;

	length = snprintf(string, sizeof(string), "%llu", (long long unsigned int)value);
	if ( length < 1 || length > (sizeof(string)-1) ) {
	    return NULL;
	}

	return newSVpv(string, length);
}
