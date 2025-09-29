set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'stage2.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "stage2.dat" using 1:2 with lines, "stage2Exp.dat" using 1:2 with points pt 2

set output
