#!/usr/bin/myperl

use diagnostics;
use Term::Spinner;

$spinner = Term::Spinner->new();

#print "Cogitating....  ";

while () {
  $spinner->advance();
  sleep 1;
}
