#!/usr/bin/perl

use diagnostics;

open(PWFILE, "glurp");
open(OUTFILE, ">output");

chmod(@entries=<PWFILE>);

foreach (@entries) {
  #print $_;
  ($user,$pw,$uid,$gid,$gecos,$home,$shell) = split(':', $_);
  print "Name: $user \n";
  print OUTFILE join(':',$user,$shell);
}

close OUTFILE;
