#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;

my %g = ();

while (<>) {
    my ($container, $content) = /(.*? bag)s contain (\d+ .+? bags?(?:, \d+ .+? bags?)*)/;
    next unless $content;
    my @content = $content =~ /\d+ (.+? bag)s?/g;
    push @{$g{$_}}, $container for @content;
}

print Dumper(\%g);

my $total = 0;
my @contents = ('shiny gold bag');
my %visited = ('shiny gold bag' => 1);

while (@contents) {
    @contents = grep { ! $visited{$_}++ } map { @{$g{$_} || []} } @contents;
    say for @contents;
    $total += @contents;
}

#print Dumper(\%visited);
print $total;