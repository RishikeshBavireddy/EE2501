# fit_diode.plt
# Gnuplot script to fit diode IV data

f(V) = Is*(exp(V/(n*Vt)) - 1)

Vt = 0.02585    # thermal voltage at room temp (fixed)
Is = 1e-12      # initial guess for saturation current
n  = 1.5        # initial guess for ideality factor

fit f(x) 'diode_IV_220.dat' using 1:2 via Is, n

set xlabel "V_{diode} (V)"
set ylabel "I (A)"
set grid

set terminal pngcairo size 800,600 enhanced font 'Arial,12'
set output '220fit.png'

plot 'diode_IV_220.dat' using 1:2 title 'Data' with linespoints pt 7, \
     f(x) title 'Fitted curve' with lines lw 2
