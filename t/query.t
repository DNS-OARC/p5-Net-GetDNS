#!perl

use Test::More;

use Net::GetDNS;

use Data::Dumper;

my ( $ctx, $dict, $userarg, $transid );

isa_ok( $ctx  = Net::GetDNS::XS::context_create( 1 ), 'Net::GetDNS::XS::ContextPtr' );
isa_ok( $dict = Net::GetDNS::XS::dict_create,         'Net::GetDNS::XS::DictPtr' );
$userarg = 123;
$transid = 0;

is(
    Net::GetDNS::XS::address(
        $ctx,
        'example.com',
        $dict,
        $userarg,
        $transid,
        sub {
            my ( $ctx, $type, $resp, $userarg, $transid ) = @_;

            my $status = -1;
            ok( !Net::GetDNS::XS::dict_get_int( $resp, 'status', $status ) );
            ok( Net::GetDNS::XS::pretty_print_dict( $resp ) );
        }
    ),
    0
);
Net::GetDNS::XS::context_run( $ctx );

done_testing;
