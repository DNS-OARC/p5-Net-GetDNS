#!perl

use Test::More;

use Net::GetDNS::XS qw(:all);

my ( $ctx, $dict );

is( getdns_context_create( $ctx, 1 ), 0 );
isa_ok( $ctx, 'Net::GetDNS::XS::ContextPtr' );
isa_ok( $dict = getdns_dict_create, 'Net::GetDNS::XS::DictPtr' );

is(
    getdns_address(
        $ctx,
        'example.com',
        $dict,
        undef,
        undef,
        sub {
            my ( $ctx, $type, $resp, $userarg, $transid ) = @_;

            my $status = -1;
            ok( !getdns_dict_get_int( $resp, 'status', $status ) );
            ok( getdns_pretty_print_dict( $resp ) );
        }
    ),
    0
);
getdns_context_run( $ctx );

done_testing;
