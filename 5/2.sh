#!/bin/sh

./1.pl < input | sort -g | perl -nE 'chomp; say $_ - 1 if $_ - $prev == 2; $prev = $_'