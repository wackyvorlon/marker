#!/usr/bin/perl

use diagnostics;
use Scalar::Util qw(dualvar);

$width = dualvar( 800, "Screen width");
$height = dualvar(600, "Screen height");
$colors = dualvar(16, "Screen colour depth");

printf "%s is %d\n", $width, $width;
printf "%s is %d\n", $height, $height;
printf "%s is %d\n", $colors, $colors;

