s=poly(0,'s')
dt=10;//delay time
//h=syslin('c',((0.510/(65.49*s+1))))//transfer function using first order pade' approximation
tf=((0.475/(36*s+1))*((-dt/2)*s+1/(dt/2)*s+1));
bode(h,0.001,10);
