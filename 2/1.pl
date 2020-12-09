#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;


my $total = 0;

while (<>) {
    my ($min, $max, $c, $word) = /^(\d+)-(\d+) (\w): (\w+)$/ or warn "Could not match $_";
    my @split = split(//, $word);
    #say "@split";
    my $cc = grep { $_ eq $c } @split;
    next if $cc < $min;
    next if $cc > $max;
    $total++;
    print "$total $cc $_";
}
