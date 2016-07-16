#!perl

use Test::More;

use Net::GetDNS;

ok( Net::GetDNS::XS::get_version,     Net::GetDNS::XS::get_version );
ok( Net::GetDNS::XS::get_api_version, Net::GetDNS::XS::get_api_version );
is( Net::GetDNS::XS::get_errorstr_by_id( 0 ), 'Good', 'Net::GetDNS::XS::get_errorstr_by_id(0)' );

my ( $o, $dict, $bindata );

isa_ok( $o = Net::GetDNS::XS::context_create( 1 ), 'Net::GetDNS::XS::ContextPtr' );
isa_ok( $o = Net::GetDNS::XS::dict_create,         'Net::GetDNS::XS::DictPtr' );
Net::GetDNS::XS::dict_destroy( $o );
isa_ok( $o = Net::GetDNS::XS::list_create, 'Net::GetDNS::XS::ListPtr' );
Net::GetDNS::XS::list_destroy( $o );

isa_ok( $bindata = Net::GetDNS::XS::Bindata->new( 'testing' ), 'Net::GetDNS::XS::BindataPtr' );
is( $bindata->get, 'testing' );
isa_ok( $dict = Net::GetDNS::XS::dict_create, 'Net::GetDNS::XS::DictPtr' );
ok( !Net::GetDNS::XS::dict_set_bindata( $dict, 'test', $bindata ) );
is( $bindata->get, 'testing' );
ok( !Net::GetDNS::XS::dict_get_bindata( $dict, 'test', $bindata ) );
is( $bindata->get, 'testing' );

done_testing;
