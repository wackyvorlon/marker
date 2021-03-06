#!/usr/bin/perl

#Playing with Algorithm::NaiveBayes

use diagnostics;
use Algorithm::Naivebayes;
use Data::Dumper;
use Lingua::EN::Splitter qw(words);
use Lingua::EN::StopWords qw(%StopWords);
use File::Slurp::Unicode;

#$Lingua::EN::Splitter::NON_WORD_CHARACTER=qr/\W/;

sub invert_string {
  #Takes string input, creates hash of words weighted by count.
  my ($string,$weight,$hash) = @_;
  $string =~ s/\[|\]//g;
  $hash->{$_} += $weight for
    grep {!$StopWords{$_}}
      @{words(lc($string))};
}

my $nb = Algorithm::NaiveBayes->new;

#$nb->add_instance(attributes => {foo => 1, bar => 1, baz => 3}, label => 'sports');

#$nb->add_instance(attributes => {foo => 2, blurp => 1}, label => ['sports','finance']);

#$nb->train;

#my $result = $nb->predict(attributes => {bar => 3, blurp => 2});

#print Dumper(\$result);

$text=read_file('002.txt');

my %valhash;

invert_string($text, 1, \%valhash);  #Generate hash of words with word count.

#print Dumper(\%valhash);

$nb->add_instance(attributes => \%valhash, label => 'rhynch');

#$nb->train;

#my $result = $nb->predict(attributes => \%valhash);

$subject = read_file('input2.txt'); #Read next document.

my %newhash;

invert_string($subject, 1, \%newhash);

$nb->add_instance(attributes => \%newhash, label => 'wonderland');

$nb->train;

my %testhash;
$input3 = read_file('001.txt');
invert_string($input3, 1, \%testhash);

my $result = $nb->predict(attributes => \%testhash);

print Dumper(\$result);

