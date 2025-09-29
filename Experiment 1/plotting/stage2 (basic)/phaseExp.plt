set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'stage2ph.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "stage2.dat" using 1:3 with lines, "stage2Exp.dat" using 1:3 with points pt 2

set output
