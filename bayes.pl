#!/usr/bin/perl

#Playing with Algorithm::NaiveBayes

use diagnostics;
use Algorithm::Naivebayes;
use Data::Dumper;

my $nb = Algorithm::NaiveBayes->new;

$nb->add_instance(attributes => {foo => 1, bar => 1, baz => 3}, label => 'sports');

$nb->add_instance(attributes => {foo => 2, blurp => 1}, label => ['sports','finance']);

$nb->train;

my $result = $nb->predict(attributes => {bar => 3, blurp => 2});

print Dumper(\$result);

