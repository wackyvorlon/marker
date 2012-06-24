#!/usr/bin/perl

use Net::LDAP;

$ldap = Net::LDAP->new("localhost") or die "$@";

$mesg = $ldap->bind;
$mesg = $ldap->search(base => "c=CA");

