#!/usr/bin/perl

use Lingua::Any::Numbers qw(:std);
use diagnostics;
use Expect;


#print to_string(45);

$exp=new Expect;
$exp->raw_pty(1);

$from=1;
$from=$ARGV[0] if $ARGV[0]; # If there's a value on the command line, use that instead.

$to=10;
$to=$ARGV[1] if $ARGV[1];


$exp->spawn("../ass2");

$errors=0;


for ($from..$to) {
    $num=to_string($_);
    $num =~ s/-/ /g;
    $num =~ s/ and//g; # Jeff's code barfs on the word "and".
    #$exp->spawn("../ass2");
    $exp->send("$num\n");
    $foo=$exp->expect(5, $_);

    print "Did not receive expected value of $_.\n" unless $foo;
    $errors++ unless $foo;
    
    
    #print "$num\n";
    #$exp->hard_close();
    
    
}

print "\n Total number of errors: $errors\n";

$exp->hard_close();
