#!/usr/bin/perl

use v5.28.0;
use strict;
use warnings;
no warnings 'experimental';

my $dirs = 'NESW';
my $dir = 'E';
my ($e, $n) = (10, 1);
my ($x, $y) = (0, 0);

while (<>) {
    my ($c, $d) = /^([NESWLRF])(\d+)$/;
    given ($c) {
        when ('N') { $n += $d };
        when ('S') { $n -= $d };
        when ('E') { $e += $d };
        when ('W') { $e -= $d };
        when ('L') { ($e, $n) = (-$n, $e) while ($d -= 90) + 90 };
        when ('R') { ($e, $n) = ($n, -$e) while ($d -= 90) + 90 };
        when ('F') { $x += ($e * $d); $y += ($n * $d); }
    }

}
say abs($x) + abs($y);
