#!/usr/bin/myperl

use diagnostics;
use Term::Activity;

$ta = new Term::Activity;

#$foo=100;

#while () {
#  $ta->tick;
#  sleep 0.5;
#  $foo--;
#}

for ($i=0;$i<100;$i++) {
  $ta->tick;
  sleep 1;
}
