set terminal pngcairo size 1000,800 enhanced font "Helvetica,16"
set output "darkplt.png"

set title "I-V Characteristics of solar cell under dark conditions" font ",18"
set xlabel "Voltage across diode (V)" font ",14"
set ylabel "Current (mA)" font ",14"
set grid lc rgb "#aaaaaa" lw 1 lt 0
set border lw 2
set key top left box

set style line 1 lc rgb "#1f77b4" lw 2 pt 7 ps 1.5
set style line 2 lc rgb "#ff7f0e" lw 2
set style line 3 lc rgb "#000000" lw 1 dt 2  # dotted line style (black)

# Dotted reference lines at x=0 and y=0
set arrow from graph 0,first 0 to graph 1,first 0 nohead ls 3
set arrow from first 0,graph 0 to first 0,graph 1 nohead ls 3

plot "dark.dat" using 1:2 with points ls 1 title "Measured Data", \
     "dark.dat" using 1:2 with lines ls 2 title "Connected Curve"
