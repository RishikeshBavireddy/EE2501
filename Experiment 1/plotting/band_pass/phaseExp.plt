set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'bandphexp.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "band.dat" using 1:3 with lines, "bandexp.dat" using 1:3 with points pt 2

set output
