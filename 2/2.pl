#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;


my $total = 0;

while (<>) {
    my ($p1, $p2, $c, $word) = /^(\d+)-(\d+) (\w): (\w+)$/ or warn "Could not match $_";
    my $c1 = substr($word, $p1-1, 1);
    my $c2 = substr($word, $p2-1, 1);
    my $match = ($c1 ne $c2) && (($c1 eq $c) || ($c2 eq $c));
    next unless $match;
    $total++;
    print "$total $match $c1 $c2 $_";
}
