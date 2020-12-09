#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

$/ = '';

my @valid = qw( byr iyr eyr hgt hcl ecl pid ); # cid is optional
my $total = 0;

while (<>) {
    my %fields = map { split ':' } split /\s+/;
    my $valid = @valid == grep { exists $fields{$_} } @valid;
    $total++ if $valid;

    for my $key (keys %fields) {
        print "$key:$fields{$key}\n";
    }
    print "$valid\n\n";
}
print $total;