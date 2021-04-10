#! /usr/bin/gawk -f
$8 == 131 {x += 1}
END {print "Total de buses T31: " x }