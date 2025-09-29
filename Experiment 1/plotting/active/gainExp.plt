set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'activeExp.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "active.dat" using 1:2 with lines, "activeExp.dat" using 1:2 with points pt 2

set output
