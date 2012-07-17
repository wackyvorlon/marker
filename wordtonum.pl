#!/usr/bin/perl

#Convert words on stdin to numbers.
use diagnostics;


# Define our hashes.

%nums = ('ten' => 10,
	  'eleven' => 11,
	  'twelve' => 12,
	  'thirteen' => 13,
	  'fourteen' => 14,
	  'fifteen' => 15,
	  'sixteen' => 16,
	  'seventeen' => 17,
	  'eighteen' => 18,
	  'nineteen' => 19,
	  'twenty' => 20,
	  'thirty' => 30,
	  'forty' => 40,
	  'fifty' => 50,
	  'sixty' => 60,
	  'seventy' => 70,
	  'eighty' => 80,
	  'ninety' => 90,
	  'one' => 1,
	  'two' => 2,
	  'three' => 3,
	  'four' => 4,
	  'five' => 5,
	  'six' => 6,
	  'seven' => 7,
	  'eight' => 8,
	  'nine' => 9
	   );

%others = ('hundred' => 100,
	   'thousand' => 1000,
	   'million' => 1000000
	  );

# Lets get some data!



while (<>) {
  #print $_;
  chomp; # Remove spurious newline.
  my @val = split; #Extract words.
  $final =0;
  
  while ($value = shift @val) {
    #print $val[0];
    if ($nums{$value}) {
      if ($others{$val[0]}) {
	#print "Power of ten...";
	$final += $nums{$value}*$others{$val[0]};
      } else {
	#print "No power of ten.";
	$final += $nums{$value};
      }
    }
  }

    
  
  print "$final\n";
}
