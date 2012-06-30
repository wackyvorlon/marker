#!/usr/bin/perl

#Load modules, use MD5 hash to identify already seen documents. Result of processing stored in a hash tied to a file.

use CHI;   #Handles caching.
use Digest::MD5;    #MD5 hash determines if we've seen this doc before.
use Text::Markdown qw(markdown); #Convert markdown to HTML
use File::Slurp;    #Generic functions for reading in files.
#use diagnostics;    #Gives more informative errors.


#Caching setup

my $cache = CHI->new( driver => 'File',
		      root_dir => './'
		    );


($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
 $atime,$mtime,$ctime,$blksize,$blocks)
  = stat($ARGV[0]);

#Grab data
#$data = read_file($ARGV[0]);

#$digest = Digest::MD5::md5($data);

$key=$mtime.$ARGV[0];



my $value = $cache->compute($key, '5min', sub {
			      $data=read_file($ARGV[0]);
			      my $html = markdown($data);
			      return $html;
			    });

print $value;

#print $key;
