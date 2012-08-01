#!/usr/bin/myperl

use WWW::Mechanize;

my $mech=WWW::Mechanize->new(onerror=>undef);

#$mech->get("http://socr.uwindsor.ca/~ander1x/index.php");

#print $mech->status();

#if ($mech->status() == 404) {
#    print "\n No exist!";
#}

while ($name=getpwent()) {
    print "\n Checking: $name";
    $mech->get("http://socr.uwindsor.ca/~$name/index.php");
    if ($mech->status() == 404) {
	#print "...No index.php found.";
    } else {
	print "...index.php found.";
	next;
    }
    $mech->get("http://socr.uwindsor.ca/~$name/index.html");
    if ($mech->status() == 404) {
	#print "...No index.html found.";
    } else {
	print "...index.html found.";
    }

    #print "\n";
}

print "\n";


