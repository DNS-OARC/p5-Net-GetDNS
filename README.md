# p5-Net-GetDNS

Perl bindings for getdns, a modern asynchronous DNS API

## Depends

See https://github.com/jelu/apps/blob/u16/develop/getdns/Dockerfile

## Build

```
perl Makefile.PL
RELEASE_TESTING=1 TEST_AUTHOR=1 make all test
```

## Usage

See `t/query.t` or `t/syncquery.t`.
