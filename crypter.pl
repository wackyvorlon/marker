#!/usr/bin/perl

use diagnostics;
use Digest::MD5 qw(md5 md5_hex md5_base64);

open(INPUT, "<glurp") or die $!;

$foo = Digest::MD5->new;

$foo->addfile(INPUT);

$digest = $foo->digest;

print $digest;




print "\n";
