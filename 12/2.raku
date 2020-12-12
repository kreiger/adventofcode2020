#!/usr/bin/raku

my $w = 10+1i;
my $s = 0+0i;

for lines() {
    my ($command, $d) = @( $_ ~~ /(\w)(\d+)/ );
    given $command {
        when 'N' { $w += $d*i };
        when 'S' { $w -= $d*i };
        when 'E' { $w += $d };
        when 'W' { $w -= $d };
        when 'L' { $w *=  i while ($d -= 90) + 90 };
        when 'R' { $w *= -i while ($d -= 90) + 90 };
        when 'F' { $s += $w * $d; }
    }

}
say abs($s.re) + abs($s.im);
