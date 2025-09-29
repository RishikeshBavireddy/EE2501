set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'phase.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "stage1.dat" using 1:3 with lines , "stage2.dat" using 1:3 with lines
set output
