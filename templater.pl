#!/usr/bin/perl -w
# templater.pl --- A program to do templating for SOCR
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 19 Jul 2012
# Version: 0.01

use warnings;
#use strict;
use diagnostics;
use File::Slurp;
use File::Basename;
use Text::MultiMarkdown qw(markdown);

die "Nothing on command line!\n" unless @ARGV;   # Need some filenames.

#$tmpl=read_file($ARGV[0]) or die $!;  # First file is the template.
#$input=read_file($ARGV[1]) or die $!; # Second is our input.

#$html = markdown($input);
#$tmpl =~ s/HERE/$html/;

#write_file($ARGV[2], $tmpl) or die $!;

#Snarf data.
#$page=read_file($ARGV[0]) or die $!;

#Look for include directives.

#Parse the markdown.

$html=markdown($page);

#Dump to disk.
$fname=$ARGV[0];
$fname=~ s/\.md//;
$fname=$fname.".html";

print STDERR "Output filename: $fname\n";

#write_file($fname) or die $!;



__END__

=head1 NAME

templater.pl - Processes markdown templates for SOCR.

=head1 SYNOPSIS

templater.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Takes a template and processes it. include directive causes loading of named file.

=head1 AUTHOR

Paul Anderson, E<lt>ander1x@uwindsor.caE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Paul Anderson

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
