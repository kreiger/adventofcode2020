#!/usr/bin/perl

use v5.28.0;

use warnings;
use strict;

my @prev = ();

INPUT: while (<>) {
    chomp;
    next if @prev < 25;
    for my $i (@prev) {
        for my $j (@prev) {
            next if $i == $j;
            next INPUT if $i + $j == $_;
        }
    }
    say $_;
    last;
} continue {
    shift @prev if @prev == 25;
    push @prev, $_;
}
