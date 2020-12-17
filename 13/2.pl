#!/usr/bin/perl

use v5.28.0;
use strict;
use warnings;

use Math::Prime::Util 'chinese';

my $arrival = int <>;
my $ids = <>;
chomp($ids);
my @ids = split ',', $ids;

my @congruences = grep { $_->[1] ne 'x' } map { [ -$_, $ids[$_] ] } 0..$#ids;
say "$_->[0] mod $_->[1]" for @congruences;

say chinese @congruences;
