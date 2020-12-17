#!/usr/bin/perl

use v5.28.0;
use integer;

use strict;
use warnings;

use Data::Dumper;
use List::Util 'sum';

my $or = 0;
my $and = 0;
my %mem = ();
while (<>) {
    if (my ($mask) = /^mask = ([01X]{36})$/) {
        $or = $mask =~ tr/X/0/r;
        $and = $mask =~ tr/X/1/r;
    } elsif (my ($address, $in) = /^mem\[(\d+)\] = (\d+)$/) {
        my $out = $in & oct("0b$and") | oct("0b$or") ;
        $mem{$address} = $out;
    }
}

say say Dumper(\%mem);
say sum values %mem;