#!/usr/bin/perl -w

use diagnostics;
use Tie::File;

tie @array, 'Tie::File', bork or die "She is angry, $!";

for ($i=0;$i<20;$i++) {
    $array[$i]=$i;
}

untie @array;

