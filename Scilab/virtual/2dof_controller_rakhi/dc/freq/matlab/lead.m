clear all
L = 34.2*pi/180; Omega = 3; Ts = 0.2;
[a,b] = lead_solve(L,Omega,Ts);
GD = tf([1 -a],[1 -b],Ts)
[mag,phase] = bode(GD,Omega)
