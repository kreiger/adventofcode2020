#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;

$/ = "";
my $total = 0;

while (<>) {
    chomp;
    my @persons = split /\n/;
    my %kept = ();

    for my $person (@persons) {
        my @split = grep { /[a-z]/ } split //, $person;
        $kept{$_}++ for @split;
    }
    my $kept = grep { $kept{$_} == @persons } keys %kept;
    $total += $kept;
    say "$_\n$kept $total";
}
