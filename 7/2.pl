#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;

my %g = ();

while (<>) {
    my ($container, $content) = /(.*? bag)s contain (\d+ .+? bags?(?:, \d+ .+? bags?)*)/;
    next unless $content;
    while ($content =~ /(\d+) (.+? bag)s?/g) {
        my @dupes = ($2) x $1;
        push @{$g{$container}}, @dupes;
    }
}

print Dumper(\%g);

my $total = 0;
my @containers = ('shiny gold bag');

while (@containers) {
    say for @containers;
    @containers = map { @{$g{$_} || []} } @containers;
    $total += @containers;
}

print $total;