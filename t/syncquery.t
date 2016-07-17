#!perl

use Test::More;

use Net::GetDNS::XS qw(:all);

my ( $ctx, $dict, $resp );

is( getdns_context_create( $ctx, 1 ), 0 );
isa_ok( $ctx, 'Net::GetDNS::XS::ContextPtr' );
isa_ok( $dict = getdns_dict_create, 'Net::GetDNS::XS::DictPtr' );

is(
    getdns_address_sync(
        $ctx,
        'example.com',
        $dict,
        $resp,
    ),
    0
);

isa_ok( $resp, 'Net::GetDNS::XS::DictPtr' );

done_testing;
