#!/usr/bin/perl

use Lingua::Any::Numbers qw(:std);
use diagnostics;


#print to_string(45);

$to=100;
$to=$ARGV[0] if $ARGV[0]; # If there's a value on the command line, use that instead.


for (1..$to) {
    $num=to_string($_);
    $num =~ s/-/ /g;
    
    print "$num\n";
    
}
