#!/usr/bin/myperl -w
# cursesprogbar.pl --- Playing with progressbar widget
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 04 Aug 2012
# Version: 0.01

use warnings;
#use strict;
use Curses::Widgets;
use Curses::Widgets::ProgressBar;

$progress = Curses::Widgets::ProgressBsr->({
    CAPTION => 'Progress',
    CAPTIONCOL => 'yellow',
    LENGTH => 10,
    VALUE => 0,
    FOREGROUND => undef,
    BACKGROUND => 'black',
    BORDER => 1,
    BORDERCOL => undef,
    HORIZONTAL => 1,
    X => 1,
    Y => 1,
    MIN => 0,
    MAX => 100,
})

__END__

=head1 NAME

cursesprogbar.pl - Describe the usage of script briefly

=head1 SYNOPSIS

cursesprogbar.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for cursesprogbar.pl, 

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
