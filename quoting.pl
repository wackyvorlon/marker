#!/usr/bin/perl -w
# quoting.pl --- Testing effects of quoting in perl.
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 31 Jul 2012
# Version: 0.01

#use warnings;
#use strict;

$foo=6;

print("$foo");
print('$foo');

print ("\n");


__END__

=head1 NAME

quoting.pl - Describe the usage of script briefly

=head1 SYNOPSIS

quoting.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for quoting.pl, 

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
