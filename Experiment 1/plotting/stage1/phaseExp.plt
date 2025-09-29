set terminal postscript eps enhanced color font 'Times,12'
set logscale  x
set output 'stage1phExp.eps'

set xlabel 'Frequency (Hz)'
set ylabel 'Phase (Rad)'
set grid

plot "stage1.dat" using 1:3 with lines, "stage1Exp.dat" using 1:3 with points pt 2

set output
