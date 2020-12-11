#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Data::Dumper;
use List::Util qw(sum);
use List::MoreUtils 'pairwise';

my @input = map { chomp; [ split '', $_ ] } <>;

my $width = @{$input[0]};

my @neighbours = grep { $_->[0] || $_->[1] } map { my $x = $_; map { [ $x, $_ ] } -1..1 } -1..1;

say "@{$_}" for @neighbours;

my @previous = @input;
my @next = ();
while (1) {
    for (my $x = 0; $x < $width; ++$x) {
        for (my $y = 0; $y < @previous; ++$y) {
            my $pos = $previous[$y][$x];
            $next[$y][$x] = $pos;
            next if $pos eq '.';
            my $count = grep { $_ eq '#' } 
                         map { my ($rx, $ry) = (@{$_});
                               my ($nx, $ny) = ($x + $rx, $y + $ry);
                               my $result = '';
                               while ($nx >= 0 && $ny >= 0 && $nx < $width && $ny >= 0 && $ny < @input && (($result = $previous[$ny][$nx]) eq '.')) {
                                   $nx += $rx;
                                   $ny += $ry;
                               }
                               $result } @neighbours;
            say $count if $x == 1 && $y == 1;
            if ($count == 0 && $pos eq 'L') {
                $next[$y][$x] = '#';
            } elsif ($count >= 5 && $pos eq '#') {
                $next[$y][$x] = 'L';
            }
        }
    }
    my $jp = join "\n", map { join '', @{$_} } @previous ;
    my $jn = join "\n", map { join '', @{$_} } @next;
    say $jp, "\n";
    last if  $jp eq $jn;
    @previous = map { [ @{$_}] } @next;
}

say join "\n", map { join '', @{$_}, ' ', (0+grep { $_ eq '#' } @{$_}) } @next;

say 0+grep { $_ eq '#' } map { @{$_} } @next;
