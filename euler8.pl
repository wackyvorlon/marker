#!/usr/bin/myperl -w
# euler8.pl --- Euler Problem 8
# Author: Paul Anderson <wackyvorlon@paul-andersons-macbook-pro-3.local>
# Created: 14 Aug 2012
# Version: 0.01

use warnings;
use diagnostics;
use 5.16.0;

#use strict;
no strict;


# The number.

$numb="7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";

$result=0;


while ($numb=~/(\d)(\d)(\d)(\d)(\d)/gi) {
    $cur = $1*$2*$3*$4*$5;          # Put the product in a variable.
    pos $numb=(pos $numb) - 4;                   # Reset position where matching will begin.
                                             # pos $num defaults to the position just
                                             # after the *last* character in our match.
                                             # We want our second match to begin after
                                             # the *first* character.
    if ( $cur > $result) {
        $result=$cur;
        
    }
    
}

print "\nGreatest value is $result.\n";


__END__

=head1 NAME

euler8.pl - Describe the usage of script briefly

=head1 SYNOPSIS

euler8.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for euler8.pl, 

=head1 AUTHOR

Paul Anderson, E<lt>wackyvorlon@paul-andersons-macbook-pro-3.localE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Paul Anderson

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
