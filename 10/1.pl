#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;
use List::Util qw(max reduce);

my @input = sort { $a <=> $b } map { chomp; $_ } <>;

my $target = max(@input) + 3;

my @jolts = (@input, $target);

my %dist = ();

my $prev = 0;
for my $next (@jolts) {
    my $diff = $next - $prev;
    say "$next - $prev = $diff";
    $dist{$diff}++;
    $prev = $next;
}

print Dumper(\%dist);
print $dist{1} * $dist{3};