#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

my @input = ();

while (<>) {
    my ($i, $v) = /^(nop|acc|jmp) ([+-]\d+)$/;
    push @input, [ $i, $v ];
}


BRUTE: for (my $i = 0; $i < @input; $i++) {
    next if $input[$i]->[0] eq 'acc';
    my @ins = map { [ $_->[0], $_->[1], 0 ] } @input;
    $ins[$i] = [ $input[$i]->[0] eq 'jmp' ? 'nop' : 'jmp', $input[$i]->[1], 0];
    say "Replaced $i";

    my $acc = 0;
    my $ip = 0;
    while ($ip >= 0 && $ip < @ins) {
        my $ins = $ins[$ip];
        if ($ins->[2]++) {
           warn "acc $acc at line $ip: @{$ins}\n";
           next BRUTE;
        }
        my ($i, $v, $c) = @{$ins};
        if ($i eq 'acc') {
            $acc += $v;
            $ip++;
        } elsif ($i eq 'nop') {
            $ip++;
        } elsif ($i eq 'jmp') {
           $ip += $v;
        }
    }
    die "Terminated: $acc";

}

