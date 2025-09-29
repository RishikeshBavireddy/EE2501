set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'gain.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Gain (dB)'
set grid

plot "stage1.dat" using 1:2 with lines , "stage2.dat" using 1:2 with lines
set output
