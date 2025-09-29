# fit_solar.gp
# Data file: col1 = V (V), col2 = I (A)
datafile = "solar_data.dat"

# Physical constant (set thermal voltage; change n if you want)
Vt = 0.02585    # ~25.85 mV at 300K
n  = 1.2        # diode ideality factor (adjust if you know it)
nVt = n*Vt

# Model: we use measured I on RHS so gnuplot fit is explicit
Iph = 0.03      # initial guess for photocurrent (A)  -- adjust to approx Isc
I0  = 1e-9      # initial guess for diode saturation current
Rs  = 0.5       # initial guess for series resistance (ohm)
Rsh = 5000      # initial guess for shunt resistance (ohm)

# model residual at measured V,I
resid(V,I) = I - ( Iph - I0*(exp((V + I*Rs)/nVt) - 1) - (V + I*Rs)/Rsh )

# fit residuals (minimize sum of resid^2 over data)
# using columns 1 (V) and 2 (I)
fit resid(x,y) datafile using 1:2 via Iph,I0,Rs,Rsh

# show fitted values
print "Fitted Iph  = ", Iph
print "Fitted I0   = ", I0
print "Fitted Rs   = ", Rs
print "Fitted Rsh  = ", Rsh

# produce file with measured V, measured I, and computed Vd = V + I*Rs
set print "fitted_point_data.dat"
set table "fitted_point_data.dat"
plot datafile using 1:( $2 ):( $1 + $2*Rs ) with table
unset table
set print

# To compute the continuous fitted I-V curve we must solve the implicit equation
# for I at each V. We'll use a simple Newton solver implemented as a gnuplot function.
# WARNING: gnuplot's iteration is limited but this basic solver works for most cells.

# Define parameters (fetched from fit result)
Iph_f = Iph
I0_f  = I0
Rs_f  = Rs
Rsh_f = Rsh
nVt_f = nVt

# Define the implicit f(I;V) = 0 to solve: f = I - [ Iph - I0*(exp((V + I*Rs)/nVt)-1) - (V+I*Rs)/Rsh ]
fI(V,I) = I - ( Iph_f - I0_f*(exp((V + I*Rs_f)/nVt_f) - 1) - (V + I*Rs_f)/Rsh_f )

# derivative df/dI
dfdI(V,I) = 1 - ( I0_f*(Rs_f/nVt_f)*exp((V + I*Rs_f)/nVt_f) ) - (Rs_f/Rsh_f)

# Newton solver: iterate K times starting from I0_guess
newton_I(V, Iguess) = ( \
    (\
      Iguess = Iguess - fI(V,Iguess)/dfdI(V,Iguess), \
      Iguess = Iguess - fI(V,Iguess)/dfdI(V,Iguess), \
      Iguess = Iguess - fI(V,Iguess)/dfdI(V,Iguess), \
      Iguess = Iguess - fI(V,Iguess)/dfdI(V,Iguess), \
      Iguess \
    ) \
)

# generate fitted curve by solving for I at each V
set samples 201
set table "fitted_IV_curve.dat"
do for [V=0:0.8:0.8/(201-1)] {
    Iguess = 0.0  # initial guess (for power-generating branch try short-circuit current ~Iph)
    Ifit = newton_I(V,Iguess)
    Vd   = V + Ifit*Rs_f
    print V, Ifit, Vd
}
unset table

# Plot measured points and fitted curve
set xlabel "V (V)"
set ylabel "I (A)"
set grid
plot datafile using 1:2 title "Measured" with points pt 7, \
     "fitted_IV_curve.dat" using 1:2 title "Fitted (model)" with lines lw 2

pause -1
