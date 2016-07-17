#!/bin/sh

perl -ne 's/[\r\n]+/ /o; print' "$1" | \
  perl -ne 's/\/\*/\/*__COMMENT__ /go; print join("\n", split(/(?:\/\*|\*\/)/o))' | \
  perl -ne 'next if (/^__COMMENT__/); s/;/;\n/go; print' | \
  perl -ne 's/^\s+//o; s/ +/ /go; print'
