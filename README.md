marker
======

Markdown handler

And other random bits of perl code. The main code is in templater.pl.

# NOTE! Interpreter is called 'myperl', because that is a symlink to my personal install of perl.

This is done for compatibility with [Perlbrew](https://www.perlbrew.pl), a very useful system. The hash bang will need to be changed on your system to an appropriate value.


## grammar.pl

This is an attempt at playing with Regexp::Grammars. It doesn't work. The code reports an internal error, I'm not entirely sure why. The error is thus:

    Internal error: this shouldn't happen!
    Near '0':  at /Users/wackyvorlon/perl5/perlbrew/perls/perl-5.16.0/lib/site_perl/5.16.0/Regexp/Grammars.pm line 1711.

## bayes.pl

Uses Algorithm::NaiveBayes to do a simple Bayesian comparison on some text.

## bogosorter.pl

Compares a [bogosort](http://catb.org/jargon/html/B/bogo-sort.html) in speed to Perl's internal sort command. Short answer: Bogosort sucks.

Uses Acme::Sort::Bogosort.

## checkweb.pl

A script written for a friend. He needed to see which accounts on a system had websites up. Uses WWW::Mechanize to try accessing said sites.