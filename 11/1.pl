#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;
use List::Util qw(sum);

my @input = map { chomp; [ split '', $_ ] } <>;

my $width = @{$input[0]};

my @neighbours = grep { $_->[0] || $_->[1] } map { my $x = $_; map { [ $x, $_ ] } -1..1 } -1..1;

say Dumper(\@neighbours);

my @previous = @input;
my @next = ();
while (1) {
    for (my $x = 0; $x < $width; ++$x) {
        for (my $y = 0; $y < @previous; ++$y) {
            my $pos = $previous[$y][$x];
            $next[$y][$x] = $pos;
            next if $pos eq '.';
            my $count = grep { my ($nx, $ny) = @{$_}; $previous[$ny][$nx] eq '#' } 
                        grep { my ($nx, $ny) = @{$_}; $nx >= 0 && $ny >= 0 && $nx < $width && $ny >= 0 && $ny < @input } 
                         map { [$x + $_->[0], $y + $_->[1] ] } @neighbours;
            if ($count == 0 && $pos eq 'L') {
                $next[$y][$x] = '#';
            } elsif ($count >= 4 && $pos eq '#') {
                $next[$y][$x] = 'L';
            }
        }
    }
    my $jp = join '', map { @{$_},"\n" } @previous ;
    my $jn = join '', map { @{$_},"\n" } @next;
    say $jp, "\n";
    last if  $jp eq $jn;
    @previous = map { [ @{$_}] } @next;
}

say join "\n", map { join '', @{$_}, ' ', (0+grep { $_ eq '#' } @{$_}) } @next;

say 0+grep { $_ eq '#' } map { @{$_} } @next;
