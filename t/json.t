
BEGIN {
  unless (eval {; require JSON::Tiny; 1 } && !$@ ) {
    require Test::More;
    Test::More::plan(skip_all => 
      'these tests require JSON::Tiny'
    );
  }
}

use Test::More;
use strict; use warnings FATAL => 'all';

use JSON::Tiny;
use List::Objects::WithUtils;

my $js = JSON::Tiny->new;

{ my $obj = array(1,2,3);
  ok my $res = $js->encode($obj), 'encoded array';
  my $arr = $js->decode($res);
  is_deeply $arr, [ 1, 2, 3 ], 'round-tripped array';
}

{ my $obj = immarray(1,2,3);
  ok my $res = $js->encode($obj), 'encoded immarray';
  my $arr = $js->decode($res);
  is_deeply $arr, [ 1, 2, 3 ], 'round-tripped immarray';
}

{ my $obj = hash(foo => 'bar');
  ok my $res = $js->encode($obj), 'encoded hash';
  my $hash = $js->decode($res);
  is_deeply $hash, +{ foo => 'bar' }, 'round-tripped hash';
}

done_testing;
