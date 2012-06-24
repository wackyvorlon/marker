#!/usr/bin/perl

use diagnostics;

open(pwfile, "glurp");

chmod(@entries=<pwfile>);

foreach (@entries) {
  print $_;
}
