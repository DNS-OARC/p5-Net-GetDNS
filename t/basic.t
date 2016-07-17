#!perl

use Test::More;

use Net::GetDNS::XS;

ok( Net::GetDNS::XS::getdns_get_version,     Net::GetDNS::XS::getdns_get_version );
ok( Net::GetDNS::XS::getdns_get_api_version, Net::GetDNS::XS::getdns_get_api_version );
is( Net::GetDNS::XS::getdns_get_errorstr_by_id( 0 ), 'Good' );

my ( $o, $dict, $bindata );

is( Net::GetDNS::XS::getdns_context_create( $o, 1 ), 0 );
isa_ok( $o, 'Net::GetDNS::XS::ContextPtr' );
$o = undef;

isa_ok( $o = Net::GetDNS::XS::getdns_dict_create, 'Net::GetDNS::XS::DictPtr' );
Net::GetDNS::XS::getdns_dict_destroy( $o );
$o = undef;

isa_ok( $o = Net::GetDNS::XS::getdns_list_create, 'Net::GetDNS::XS::ListPtr' );
Net::GetDNS::XS::getdns_list_destroy( $o );
$o = undef;

isa_ok( $bindata = Net::GetDNS::XS::Bindata->new( 'testing' ), 'Net::GetDNS::XS::BindataPtr' );
is( $bindata->get, 'testing' );
isa_ok( $dict = Net::GetDNS::XS::getdns_dict_create, 'Net::GetDNS::XS::DictPtr' );
ok( !Net::GetDNS::XS::getdns_dict_set_bindata( $dict, 'test', $bindata ) );
is( $bindata->get, 'testing' );
ok( !Net::GetDNS::XS::getdns_dict_get_bindata( $dict, 'test', $bindata ) );
is( $bindata->get, 'testing' );
Net::GetDNS::XS::getdns_dict_destroy( $dict );
$dict = undef;

done_testing;
