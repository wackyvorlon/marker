#!/usr/bin/perl

use diagnostics;
use YAML::XS;
#use Data::Dumper;

open( PWFILE, "glurp" );

#open(OUTFILE, ">output");

chomp( @entries = <PWFILE> );

#%data{}{}= ( ); #Empty hash of hashes

foreach (@entries) {

    #print $_;
    ( $user, $pw, $uid, $gid, $gecos, $home, $shell ) = split( ':', $_ );
    if ( $user =~ /#/ ) {    #Eat comment lines.
        next;
    }

    %data = (
        $user => {
            "pw"    => $pw,
            "uid"   => $uid,
            "gid"   => $gid,
            "gecos" => $gecos,
            "home"  => $home,
            "shell" => $shell
        }
    );    #Add to hash.

    #print "Name: $user \n";
    print Dump(\%data);
    #  print OUTFILE join(':',$user,$shell);
}

#close OUTFILE;

#print Dump( \%data );

#print Dumper(\%data);
