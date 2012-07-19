#!/usr/bin/perl

use Lingua::Any::Numbers qw(:std);
use diagnostics;


#print to_string(45);

for (1..100) {
    $num=to_string($_);
    $num =~ s/-/ /g;
    
    print "$num\n";
    
}
