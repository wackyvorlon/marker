#!/usr/bin/perl

use diagnostics;
use Lingua::EN::Splitter qw(words);
use Lingua::EN::Sentence qw(get_sentences);
use File::Slurp;
use Lingua::Stem::En;
use Lingua::EN::StopWords qw(%StopWords);
use List::Util qw(sum);
use strict;

my %base;
my %per_file;

my $amount = shift;
for my $file (<*.txt>) {
    my $sentences = get_sentences( scalar read_file($file) );
    for my $sentence (@$sentences) {
        my @words = grep { !$StopWords{$_} } @{ words( lc $sentence ) };
        for my $word ( @{ Lingua::Stem::En::stem( { -words => \@words } ) } ) {
            $base{$word}++;
            $per_file{$file}{$word}++;
        }
    }
}

my $sum = sum values %base;
$base{$_} /= $sum for keys %base;
my %totals;

for my $file ( keys %per_file ) {
    $sum = sum values %{ $per_file{$file} };
    $per_file{$file}{$_} /= $sum for keys %{ $per_file{$file} };

}

for my $file (<*.txt>) {
    print $file, ":\n";
    my $sentences = get_sentences( scalar read_file($file) );
    my %markings;
    my $order = 0;
    for my $sentence (@$sentences) {
        my @words = grep { !$StopWords{$_} } @{ words( lc $sentence ) };
        $markings{$sentence}->{order} = $order++;
        if ( !@words ) {
            $markings{$sentence}->{score} = 0;
            next;
        }
        for my $word ( @{ Lingua::Stem::En::stem( { -words => \@words } ) } ) {
            my $score = $per_file{$file}{$word} / $base{$word};
            $markings{$sentence}->{score} += $score;
        }
        $markings{$sentence}->{score} /= @words;
    }
    my @sorted = sort { $markings{$b}->{score} <=> $markings{$a}->{score} }
      keys %markings;
    my @selected =
      sort { $markings{$a}->{order} <=> $markings{$b}->{order} }
      @sorted[ 0 .. 9 ];
    print "@selected\n\n";
}
