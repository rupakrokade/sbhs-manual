function f = lead_fun(b)
global omegam, global L
a = (cos(omegam)-b)/(1-b*cos(omegam));
f = (tan(L))^2*(1-a^2)*(1-b^2) - (a-b)^2;
