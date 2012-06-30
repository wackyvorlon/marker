#!/usr/bin/perl

#Load modules, use MD5 hash to identify already seen documents. Result of processing stored in a hash tied to a file.

use Digest::MD5;
use Tie::File;
use Text::Markdown;


