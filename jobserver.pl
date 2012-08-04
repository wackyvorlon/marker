#!/usr/bin/myperl -w
# jobserver.pl --- POE Jobserver
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 04 Aug 2012
# Version: 0.01

use warnings;

#use strict;

use POE qw(Component::Server::TCP Wheel::Run);

my %programs = {
    time   => "/bin/date",
    uptime => "/usr/bin/uptime",
    ls     => "/bin/ls /var/*",
    echo   => "/bin/cat -",
};

POE::Component::Server::TCP->new(
    Alias => "job_server",
    Port  => 32080,

    ClientConnected => sub {
        $_[KERNEL]->yield("usage");

    },
    ClientDisconnected => sub {
        delete $_[HEAP]->{job};

    },

);



__END__

=head1 NAME

jobserver.pl - Describe the usage of script briefly

=head1 SYNOPSIS

jobserver.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for jobserver.pl, 

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
