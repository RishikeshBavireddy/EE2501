set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'gainvsphase.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "stage1.dat" using 1:2 with lines , "stage1.dat" using 1:3 with lines 
set output
