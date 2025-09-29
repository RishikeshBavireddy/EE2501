set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'passive.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "passive.dat" using 1:2 with lines, "passiveExp.dat" using 1:2 with points pt 2

set output
