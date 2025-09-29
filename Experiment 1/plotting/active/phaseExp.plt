set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'activephExp.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "active.dat" using 1:3 with lines, "activeExp.dat" using 1:2 with points pt 2

set output
