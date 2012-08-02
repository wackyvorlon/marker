#!/usr/bin/myperl -w
# profanity.pl --- Testing regex to check for american profanity.
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 02 Aug 2012
# Version: 0.01

use warnings;
#use strict;

use Regexp::Profanity::US;
use Data::Dumper;


# This regex fires on weird things. It goes off on 'asshole', but not on 'cunt' or 'shit'. Bizarre.

$degree=qw(definite); # I guess ambiguous is supported too.

while (<>) {
    $profane=profane($_,$degree);
    print Dumper($profane);
    
}


__END__

=head1 NAME

profanity.pl - Describe the usage of script briefly

=head1 SYNOPSIS

profanity.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for profanity.pl, 

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
