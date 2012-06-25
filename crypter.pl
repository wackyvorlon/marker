#!/usr/bin/perl

use diagnostics;
use Crypt::SSLeay;

open(INPUT, "<glurp") or die $!;

$md=Crypt::SSLeay::MD->new("md5");

while (<INPUT>) {
  $md->update($_);
}

print unpack("H*",$md->final);

print "\n";
