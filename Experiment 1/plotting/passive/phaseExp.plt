set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'passiveph.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "passive.dat" using 1:3 with lines, "passiveExp.dat" using 1:3 with points pt 2

set output
