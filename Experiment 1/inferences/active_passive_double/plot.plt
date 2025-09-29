set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'phase.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "double.dat" using 1:2 with lines , "active.dat" using 1:2 with lines, "passive.dat" using 1:2 with lines , "theory.dat" using 1:3 with lines
set output
