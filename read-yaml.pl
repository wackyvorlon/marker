#!/usr/bin/perl

use diagnostics;
use YAML::XS;

open(INFILE, "<yaml") or die $!;

@info = <INFILE>;

print @info;
