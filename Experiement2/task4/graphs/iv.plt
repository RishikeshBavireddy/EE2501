set terminal pngcairo size 1000,800 enhanced font "Helvetica,16"
set output "iv.png"

set title "current v/s voltage across load plot of solar cell under Illumination" font ",18"
set xlabel "Voltage across load (V)" font ",14"
set ylabel "Current through R (mA)" font ",14"
set grid lc rgb "#aaaaaa" lw 1 lt 0
set border lw 2
set key top left box

set style line 1 lc rgb "#1f77b4" lw 2 pt 7 ps 1.5
set style line 2 lc rgb "#ff7f0e" lw 2

# Dotted reference lines at x=0 and y=0
set arrow from graph 0,first 0 to graph 1,first 0 nohead ls 3
set arrow from first 0,graph 0 to first 0,graph 1 nohead ls 3

plot "iv.dat" using 2:1 with points ls 1 title "Measured Data", \
     "iv.dat" using 2:1 with lines ls 2 title "Interpolated Curve"
