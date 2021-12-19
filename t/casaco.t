use Test::More;
use Marx::Commodity;

my $coat = Marx::Commodity->new( name => coat );
my $linen = Marx::Commodity->new( name => linen );

$coat->value( 2*$linen->value );

done_testing;
