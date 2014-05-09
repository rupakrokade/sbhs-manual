s=poly(0,'s');
frq = [0.001,0.0035,0.004,0.005,0.006,0.007,...
0.008,0.009,0.01,0.02,0.03,0.04];//Input frequency(Hz)
dt=10;//delay time

tf=((0.475/(36*s+1))*((-dt/2)*s+1/(dt/2)*s+1));//transfer function using pade' approximation
h=syslin('c',tf);

[frq1,rep]=repfreq(h,frq);
[dB1,phi1]=dbphi(rep);
title = 'From actual plant data';
dB  = [-3.87,-5.67,-7.53,-7.53,-8.17,-8.64,...
-8.87,-8.90,-9.11,-13.55,-15.39,-16.47];//Amplitude ratio(dB)
phi = [-25.2,-28.98,-33.11,-41.4,-60.48,...
-70.56,-77.76,-87.48,-90,-129.6,-151.2,-172.8];//Phase difference(degree)
bode([frq],[dB;dB1],[phi;phi1])
legend(['Plant data';'$\frac{0.42}{36s+1}e^{-10s}$'])

//transfer function using pade' approximation