#!/usr/bin/perl

use v5.28.0;

#use bigint;
use strict;
use warnings;

use Data::Dumper;
use List::Util qw(max sum);

my @input = sort { $a <=> $b } map { chomp; $_ } <>;

my $target = max(@input) + 3;

my %graph = ();

for my $input ((0, @input, $target)) {
    $graph{$input}{count} = 0;
    for (1..3) {
        my $neighbour = $input - $_;
        if (exists $graph{$neighbour}) {
            push @{$graph{$input}{neighbours}}, $neighbour;
            push @{$graph{$neighbour}{neighbours}}, $input;
        }
    }
}

$graph{$target}{count} = 1;

for my $input (reverse(@input), 0) {
    my $sum = sum map { $graph{$_}{count} } @{$graph{$input}{neighbours}};
    $graph{$input}{count} = $sum;
    say "$input $sum";
}

#say Dumper(\%graph);
say $graph{0}{count};
