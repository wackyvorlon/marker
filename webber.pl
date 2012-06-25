#!/usr/bin/perl

use diagnostics;
use WWW::Mechanize;

$mech=WWW::Mechanize->new();

$mech->get("www.google.ca");

print "She works!\n" if($mech->success());

