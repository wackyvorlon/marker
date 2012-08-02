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
        <Verb>
        <.ws>
        <Noun>

        <type=(?{rand>0.5 ? 'VN' : 'VerbNoun'})>
    |
        (?:
            <[Noun]>
            <[PostNoun=ws]>
        )+
        <Verb>
        <type=(?{'VN'})>
    |
        <debug: match>
        <.Cmd= (?: mv? )>
        <[File]>+
        <debug:off>
        <Dest=File>
    )
    <token: File>
        <.ws>
        <MATCH= ([\w-]+)>
    <token: Noun>
        cat | dog | fish
    <rule: Verb>
        eats
        <Object=Noun>?
    |
        <AUX>
        <part=(eaten|seen)>
    <token: AUX>
        (has | is)
        (?{ $MATCH = uc $^N })

}x;

while (<>) {
    if ( $_=~$parser) {
        print Dumper(\%/);
        
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
