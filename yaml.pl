#!/usr/bin/myperl

use YAML::XS;

#@array=qw( foo bork baz);

#print YAML::XS::Dumper(@array);

#print Dump(@array);

%snert = (
	 "alpha" => "beta",
	 "delta" => "gamma",
	 "kappa" => "mu"
);

print Dump(\%snert);
