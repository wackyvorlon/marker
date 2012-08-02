#!/usr/bin/myperl

use Lingua::Any::Numbers qw(:std);
#use diagnostics;
use Expect;
use Term::Spinner;
#use Benchmark;



#print to_string(45);


#Handle Ctrl-C sensibly.
sub INT_handler {
    $exp->hard_close;
    undef $spinner;
    
    print "\n Total number of errors: $errors\n";
    exit(0);
    
}

$SIG{'INT'} = 'INT_handler';


$exp=new Expect;
$exp->raw_pty(1);

$from=1;
$from=$ARGV[0] if $ARGV[0]; # If there's a value on the command line, use that instead.

$to=10;
$to=$ARGV[1] if $ARGV[1];



print "\nTesting... ";


$exp->spawn("../ass2");

$spinner=Term::Spinner->new();


$errors=0;

$exp->log_stdout(0);

#$t0=Benchmark->new;


for ($i=$from;$i<=$to;$i++) {
    $num=to_string($i);
    $num =~ s/-/ /g;
    $num =~ s/ and//g; # Jeff's code barfs on the word "and".
    #next if ($num =~ /hundred.*thousand/);
    #print "PING!" if $num =~ /hundred.thousand/;
    $spinner->advance;
    
    if ( $num =~ /hundred.*thousand/) {
#        print "PING!";
        $i += 899999; # Add enough to get past the hundred thousands.
        
        next;
        
    }
    
    #$exp->spawn("../ass2");
    $exp->send("$num\n");
    $foo=$exp->expect(2, $i);

    print "Did not receive expected value of $i, input was \"$num\", got ", $exp->before(), "!\n" unless $foo;
    $errors++ unless $foo;
    
    
#    print "$num\n";
    #$exp->hard_close();
    
    
}
#$t1=Benchmark->new;
#$td=timediff($t1,$t0);
#print "\nThe code took: ",timestr($td),"\n";

undef $spinner;


print "\n Total number of errors: $errors\n";

$exp->hard_close();
