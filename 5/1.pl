#!/usr/bin/perl

use v5.28.0;

use strict;
use warnings;

while (<>) {
    chomp;
    tr/FLBR/0011/;
    say oct("0b$_");

}