#!/usr/bin/perl

#Convert words on stdin to numbers.
use diagnostics;


# Define our hashes.

%teens = ('ten' => 10,
	  'eleven' => 11,
	  'twelve' => 12,
	  'thirteen' => 13,
	  'fourteen' => 14,
	  'fifteen' => 15,
	  'sixteen' => 16,
	  'seventeen' => 17,
	  'eighteen' => 18,
	  'nineteen' => 19
	 );

%tens = ('twenty' => 2,
	 'thirty' => 3,
	 'forty' => 4,
	 'fifty' => 5,
	 'sixty' => 6,
	 'seventy' => 7,
	 'eighty' => 8,
	 'ninety' => 9
	);

%singles = ('one' => 1,
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
  
  foreach my $value (@val) {
    if ($singles{$value}) {
      $final += $singles{$value};
      $prev=$singles{$value};
    } elsif ($teens{$value}) {
      $final += $teens{$value};
      $prev=$teens{$value};
    } elsif ($tens{$value}) {
      $final += $tens{$value};
      $prev=$tens{$value};
    } elsif ($others{$value}) {
      $final += $others{$value}*$prev;
    }
    
  }
  print "\n";
}
