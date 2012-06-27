#!/usr/bin/perl

#Playing with Storable

use diagnostics;
use Storable;

$foo="snickt";

store \$foo, "boo.storable";

