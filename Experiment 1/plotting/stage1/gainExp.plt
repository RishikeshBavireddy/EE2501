set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'stage1.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "stage1.dat" using 1:2 with lines, "stage1Exp.dat" using 1:2 with points pt 2

set output
