#!/usr/bin/myperl -w
# poeper.pl --- Playing with POE
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 04 Aug 2012
# Version: 0.01

use warnings;

#use strict;

use POE;

sub handler_start {
    my ( $kernel, $heap, $session ) = @_[ KERNEL, HEAP, SESSION ];
    print "Session ", $session->ID, " has started.\n";
    $heap->{count} = 0;
    $kernel->yield('increment');

}

sub handler_increment {
    my ( $kernel, $heap, $session ) = @_[ KERNEL, HEAP, SESSION ];
    print "Session ", $session->ID, " counted to ", ++$heap->{count}, ".\n";
    $kernel->yield('increment') if $heap->{count} < 10;

}

sub handler_stop {
    print "Session ", $_[SESSION]->ID, " has stopped.\n";

}

for ( 1 .. 10 ) {
    POE::Session->create(
        inline_states => {
            _start    => \&handler_start,
            increment => \&handler_increment,
            _stop     => \&handler_stop,
        }
    );

}

POE::Kernel->run();
exit;

__END__

=head1 NAME

poeper.pl - Describe the usage of script briefly

=head1 SYNOPSIS

poeper.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for poeper.pl, 

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
