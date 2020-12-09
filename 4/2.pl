#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;
use feature 'signatures';
no warnings qw(experimental::signatures);

$/ = '';

my %valid = ( 
    byr => sub ($byr) { 4 == length $byr && $byr >= 1920 && $byr <= 2002 },
    iyr => sub ($iyr) { 4 == length $iyr && $iyr >= 2010 && $iyr <= 2020 },
    eyr => sub ($eyr) { 4 == length $eyr && $eyr >= 2020 && $eyr <= 2030 },
    hgt => sub ($hgt) { my ($d, $u) = ($hgt =~ /^(\d+)(cm|in)$/); $u eq 'cm' ? ($d >= 150 && $d <= 193) : ( $d >= 59 && $d <= 76 ) },
    hcl => sub ($hcl) { $hcl =~ /^#[0-9a-f]{6}$/ },
    ecl => sub ($ecl) { 0+grep { $ecl eq $_ } qw/ amb blu brn gry grn hzl oth / },
    pid => sub ($pid) { $pid =~ /^\d{9}$/ },
); # cid is optional

my $total = 0;

while (<>) {
    my %fields = map { split ':' } split /\s+/;
    my $invalid = 0;
    for my $key (keys %valid) {
        my $value = $fields{$key};
        if (!$value) {
           print "Missing '$key'\n";
           $invalid++;
        } elsif ($valid{$key}->($value)) {
           #print "Valid '$key:$value'\n";
        } else {
           print "Invalid '$key:$value'\n";
           $invalid++;
        }
    }
    $total++ unless $invalid;
    print "$invalid\n\n";
}
print $total;