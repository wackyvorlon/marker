#!/usr/bin/myperl

use diagnostics;
use YAML::XS qw(LoadFile Dump);
use Data::Dumper;

#open(INFILE, "<yaml") or die $!;

#@info = <INFILE>;

#print @info;

%data = LoadFile("yaml") or die $!;

#print Dumper(\%data);

print Dump(\%data);
