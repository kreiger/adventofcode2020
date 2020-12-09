#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

use Term::ANSIColor qw(:constants);



my @rows = map { [ split(//, $_) ] } map { chomp; $_ } <>;

my $product = 1;
my @totals = ();
my @v = ( [3, 1] );
for my $v (@v) {
    my $total = 0;
    my ($xv, $yv) = @$v;

    my $x = 0;
    my $y = 0;
    for (my $r = 0; $r < @rows; $r++) {
        my $row = $rows[$r];
        my @row = @$row ;
        if ($r == $y) {
            if ($row[$x] eq '#') {
                $total++;
                $row[$x] = BOLD GREEN . 'X' . RESET;
            } else {
                $row[$x] = BOLD WHITE . 'O' . RESET;
            }
            $x = ($x + $xv) % @row;
            $y = ($y + $yv);
        }
        say sprintf ('%d %d %3d %s    %s', $xv, $yv, $total, join('', @row), join('', @$row));
    };
    push @totals, $total;
    $product *= $total;
}
say "@totals $product";
