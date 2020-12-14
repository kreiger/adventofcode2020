#!/usr/bin/perl

use v5.28.0;
use strict;
use warnings;

use Data::Dumper;

my $arrival = int <>;
my @ids = grep { $_ ne 'x' } split ',', <>;
say $arrival;
my %mods = map { $_ => $_ - ($arrival % $_) } map { int } @ids;
say Dumper(\%mods);