#!/usr/bin/perl

#Playing with Algorithm::NaiveBayes

use diagnostics;
use Data::Dumper;
use Lingua::EN::Splitter qw(words);
use Lingua::EN::StopWords qw(%StopWords);
use File::Slurp::Unicode;
use Unicode::UCD qw(charinfo);

#$Lingua::EN::Splitter::NON_WORD_CHARACTER=qr/\W/;

sub invert_string {
  #Takes string input, creates hash of words weighted by count.
  my ($string,$weight,$hash) = @_;
  $string =~ s/\[|\]//g;
  $hash->{$_} += $weight for
    grep {!$StopWords{$_}}
      @{words(lc($string))};
}


$text=read_file('002.txt');

my %valhash;

invert_string($text, 1, \%valhash);  #Generate hash of words with word count.

#print Dumper(\%valhash);

#$text =~ s/\[|\]//g;

#print $text;

#print Dumper(charinfo(0x263a)); 

foreach (%valhash) {
  print $_,"\n";
}
