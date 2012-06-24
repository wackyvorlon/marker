#!/usr/bin/perl

use diagnostics;

open(pwfile, "glurp");

chmod(@entries=<pwfile>);

foreach (@entries) {
  #print $_;
  ($user,$pw,$uid,$gid,$gecos,$home,$shell) = split(':', $_);
  print "Name: $user \n";
}
