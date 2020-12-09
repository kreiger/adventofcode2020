#!/usr/bin/perl

use 5.28.0;

use strict;
use warnings;

my @input = <>;
say @input;

my ($a, $b, $c);

for $a (@input) {
    for $b (@input) {
        for $c (@input) {
            chomp($a);
            chomp($b);
            chomp($c);
            say "$a + $b + $c = 2020, $a * $b * $c = ".($a*$b*$c) if ($a + $b + $c == 2020);
        }
    }
}

