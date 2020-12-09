#!/usr/bin/perl

use v5.28.0;

use warnings;
use strict;

use List::Util qw(min max sum);

my @prev = ();
my $number = 144381670;

my @terms = ();
INPUT: while (<>) {
    chomp;
    push @terms, $_;
    my $sum = sum @terms;
    last if $number == $sum;
    $sum -= shift @terms while $number < $sum;
}

say "@terms";
say sum @terms;
say min(@terms) + max(@terms);