#!/usr/bin/perl

use YAML::XS;

@array=qw( foo bork baz);

#print YAML::XS::Dumper(@array);

print Dump(@array);
