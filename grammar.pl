#!/usr/bin/myperl -w
# grammar.pl --- Playing with Regexp::Grammars
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 02 Aug 2012
# Version: 0.01

use warnings;

#use strict;
use Regexp::Grammars;
use Data::Dumper;

$parser = qr{
    (?:
        <Verb>              # Parse and save a Verb in a scalar
        <.ws>               # Parse but don't save whitespace
        <Noun>              # Parse and save a Noun in a scalar

        <type=(?{rand>0.5 ? 'VN' : 'VerbNoun'})>
                            # Save the result of expression in a scalar
    |
        (?:
            <[Noun]>        # Parse a Noun and save the result in a list
            <[PostNoun=ws]> # Parse whitespace, save it in a list
        )+
        <Verb>              # Parse verb, save in scalar
        <type=(?{'VN'})>    # Save literal in a scalar
    |
        <debug: match>      # Turn on integrated debugger
        <.Cmd= (?: mv? )>   # Parse but don't capture subpattern, for debugging purposes
        <[File]>+           # Parse 1+ files and save them in a list
        <debug:off>         # Turn off integrated debugger
        <Dest=File>         # Parse a file and save in scalar
    )
    <token: File>           # Define a subrule named File
        <.ws>               #  - parse, but don't save whitespace
        <MATCH= ([\w-]+)>   #  - parse subpattern and save in scalar
        
    <token: Noun>           # Define a subrule named Noun
        cat | dog | fish | hamster
    <rule: Verb>            # Define a whitespace sensitive subrule
        eats                # Match a literal after any space
        <Object=Noun>?      # Parse optional subrule Noun and save result under the key 'Object'
    |                       # Or else...
        <AUX>               # Parse subrule AUX and save result
        <part=(eaten|seen)> # Match a literal, save under part
        
    <token: AUX>            # Define a whitespace insensitive subrule
        (has | is)          # - match an alternative and capture
        (?{ $MATCH = uc $^N }) # - use captured text as subrule result

}x;

while (<>) {
    if ( $_ =~ $parser ) {
        print Dumper( \%/ );

    }
}

#if ( $text =~ $parser) {
#    print Dumper(\%/);
#
#}
__END__

=head1 NAME

grammar.pl - Describe the usage of script briefly

=head1 SYNOPSIS

grammar.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for grammar.pl, 

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
