#!/usr/bin/myperl -w
# mapmaker.pl --- Script to generate map using game of life.
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 04 Aug 2012
# Version: 0.01

use warnings;

#use strict;

use Game::Life;
use Data::Dumper;
use diagnostics;

$game = new Game::Life(20);

$starting = [ [ 1, 1, 1 ], [ 1, 0, 0 ], [ 0, 1, 0 ] ];

for ( 1 .. 20 ) {
    push $starting, [ int( rand(2) ), int( rand(2) ), int( rand(2) ) ];

}

$game->place_points( 10, 10, $starting );



for ( 1 .. 200 ) {
    $game->process(1);
    &printer;

}

sub printer {
    print "$_\n" foreach ( $game->get_text_grid() );
    print "\n";

}

#print Dumper( \$starting );

__END__

=head1 NAME

mapmaker.pl - Describe the usage of script briefly

=head1 SYNOPSIS

mapmaker.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for mapmaker.pl, 

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
