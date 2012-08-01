s=poly(0,'s')
h=syslin('c',((0.475/(36*s+1))*((-dt/2)*s+1/(dt/2)*s+1)))//transfer function using first order pade' approximation
bode(h,0.001,10);
