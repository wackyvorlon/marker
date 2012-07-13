#!/usr/bin/perl

#Euler problem 191


use Algorithm::Permute;

         # default is to create n of n objects permutation generator
my $p = new Algorithm::Permute(['a'..'d']);

         # but also you can create r of n objects permutation generator, where r <= n
         my $p = new Algorithm::Permute([1..4], 3);

while (@res = $p->next) {
           print join(", ", @res), "\n";
         }
