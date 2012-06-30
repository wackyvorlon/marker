#!/usr/bin/perl

#Load modules, use MD5 hash to identify already seen documents. Result of processing stored in a hash tied to a file.

use Digest::MD5;
#use Tie::Hash;
use Text::Markdown;
use File::Slurp;
use diagnostics;

my %seen;

#open(INFILE, $ARGV[0]) or die $!;

$data = read_file($ARGV[0]);

$digest = md5($data);

if (defined %seen{$digest}) {
  print "Seen this before\n";
}

