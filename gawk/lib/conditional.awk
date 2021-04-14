#! /usr/bin/gawk -f
/,131,/{if (length($4) < 3) {print $0}}
