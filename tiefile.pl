#!/usr/bin/perl -w

use Tie::File;

tie @array, 'Tie::File', bork or die "She is angry, $!";
