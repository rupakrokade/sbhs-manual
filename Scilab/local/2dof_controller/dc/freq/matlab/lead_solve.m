function [a,b] = lead(L,Omega,Ts)
global L
omegam = Omega * Ts;
global omegam
b = fsolve('lead_fun',0.5);
a = (cos(omegam)-b)/(1-b*cos(omegam));





