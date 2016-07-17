#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok( 'Net::GetDNS' )     || print "Bail out!\n";
    use_ok( 'Net::GetDNS::XS' ) || print "Bail out!\n";
}

diag( "Testing Net::GetDNS $Net::GetDNS::VERSION, Perl $], $^X" );
