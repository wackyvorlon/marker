#!/usr/bin/myperl

use diagnostics;

open(PWFILE, "glurp");
open(OUTFILE, ">output");

chomp(@entries=<PWFILE>);

foreach (@entries) {
  #print $_;
  ($user,$pw,$uid,$gid,$gecos,$home,$shell) = split(':', $_);
  if ($user=~/#/) {
    next;
  }
  print "Name: $user \n";
  print OUTFILE join(':',$user,$shell);
}

close OUTFILE;
