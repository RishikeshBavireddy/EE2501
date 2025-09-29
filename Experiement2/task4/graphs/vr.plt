set terminal pngcairo size 1000,800 enhanced font "Helvetica,16"
set output "vr.png"

set title "output voltage v/s load-resistance plot of solar cell under Illumination" font ",18"
set xlabel "Load Resistance (Ohms)" font ",14"
set ylabel  "Voltage across load resistance (V)" font ",14"
set grid lc rgb "#aaaaaa" lw 1 lt 0
set border lw 2
set key top left box

set style line 1 lc rgb "#1f77b4" lw 2 pt 7 ps 1.5
set style line 2 lc rgb "#ff7f0e" lw 2

# Dotted reference lines at x=0 and y=0
set arrow from graph 0,first 0 to graph 1,first 0 nohead ls 3
set arrow from first 0,graph 0 to first 0,graph 1 nohead ls 3

plot "vr.dat" using 2:1 with points ls 1 title "Measured Data", \
     "vr.dat" using 2:1 with lines ls 2 title "Interpolated Curve"
