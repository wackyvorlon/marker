#!/usr/bin/perl -w
# bogosorter.pl --- Playing with bogosort
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 26 Jul 2012
# Version: 0.01

#use warnings;
#use strict;

use Data::Dumper;
use List::Util qw(shuffle);
use Acme::Sort::Bogosort;
use Benchmark qw(:all :hireswallclock);

@foo = ( 1 .. 5 );

@bork = shuffle(@foo);

#print Dumper(\@bork);

$result = timethis( 5000, sub { @foo2 = bogosort(@bork) } );

print "\nRunning bogosort...\n";

#print Dumper( \@foo2 );
print timestr($result);

print "\nNow running regular sort...\n";


$result2 = timethis( 500000, sub { @foo2 = sort @bork } );

#$result3 = timediff( $result2, $result );

print timestr($result2) . "\n";

__END__

=head1 NAME

bogosorter.pl - Describe the usage of script briefly

=head1 SYNOPSIS

bogosorter.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for bogosorter.pl, 

=head1 AUTHOR

Paul Anderson, E<lt>wackyvorlon@paul-andersons-macbook-pro-3.localE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Paul Anderson

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
