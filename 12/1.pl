#!/usr/bin/perl

use v5.28.0;
use strict;
use warnings;

my $dirs = 'NESW';
my $dir = 'E';
my ($e, $n) = (0, 0);

while (<>) {
    my ($c, $d) = /^([NESWLRF])(\d+)$/;
    $c = $dir if $c eq 'F';
    given ($c) {
        when ('N') { $n += $d };
        when ('S') { $n -= $d };
        when ('E') { $e += $d };
        when ('W') { $e -= $d };
        when ('L') { $dir = substr($dirs, ((index($dirs, $dir) - ($d / 90)) % length $dirs), 1); }
        when ('R') { $dir = substr($dirs, ((index($dirs, $dir) + ($d / 90)) % length $dirs), 1); }
    }

}
say abs($e) + abs($n);