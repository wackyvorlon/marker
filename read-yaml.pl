#!/usr/bin/perl

use diagnostics;
use YAML::XS qw(LoadFile);
use Data::Dumper;

#open(INFILE, "<yaml") or die $!;

#@info = <INFILE>;

#print @info;

%data = LoadFile("yaml") or die $!;

print Dumper(\%data);
