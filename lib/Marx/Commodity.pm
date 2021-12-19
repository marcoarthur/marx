package Marx::Commodity;
use Moo;
use Marx::Types -types;

has use_value => (
    is => 'ro',
    isa => UseValue,
    required => 1,
);

has work_time => (
    is => 'ro',
    isa => WorkTime,
);

1;
