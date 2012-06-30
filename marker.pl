#!/usr/bin/perl

#Load modules, use MD5 hash to identify already seen documents. Result of processing stored in a hash tied to a file.

use Cache::Cache;   #Handles caching.
use Digest::MD5;    #MD5 hash determines if we've seen this doc before.
use Text::Markdown; #Convert markdown to HTML
use File::Slurp;    #Generic functions for reading in files.
use diagnostics;    #Gives more informative errors.

my %seen;

#open(INFILE, $ARGV[0]) or die $!;

$data = read_file($ARGV[0]);

$digest = md5($data);

if (defined %seen{$digest}) {
  print "Seen this before\n";
}

