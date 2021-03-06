#!/usr/bin/myperl -w
# templater.pl --- A program to do templating for SOCR
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 19 Jul 2012
# Version: 0.01

#use warnings;
#use strict;
use diagnostics;
use File::Slurp;
use Text::MultiMarkdown qw(markdown);
use YAML::Tiny;
use Data::Dumper;
use autodie;



die "Nothing on command line!\n" unless @ARGV;    # Need some filenames.

# Grab name of template from config file.
$yaml = YAML::Tiny->read('config');
$tpl  = $yaml->[0]->{template};

# Read in contents of the template.
$tplcontents = read_file($tpl) or die $!;

# Read in file on command line.
$input = read_file( $ARGV[0] ) or die $!;

# Do magic!

for ($tplcontents) {
    s/include (.*)/read_file($1) /ge;
}

$contents = markdown($tplcontents);


# Process markdown.
$html = markdown($input);

# Insert HTML into template.
$contents =~ s/HERE/$html/;

#print $contents;

#Dump to disk.
$fname = $ARGV[0];
$fname =~ s/\.md//;
$fname = $fname . ".html";

print STDERR "Output filename: $fname\n";

write_file($fname, $contents) or die $!;

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
