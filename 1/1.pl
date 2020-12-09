#!/usr/bin/perl

use 5.28.0;

use strict;
use warnings;

my @input = <>;
say @input;

for $a (@input) {
    for $b (@input) {
        chomp($a);
        chomp($b);
        say "$a + $b = 2020, $a * $b = ".($a*$b) if ($a + $b == 2020);
    }
}

