% function [r,b,dAFW] = ...
%    specfac3(A,degA,B,degB,rho,V,degV,W,degW,F,degF)
% Implements the spectral factorization for use with LQG control
% design method of Sternard, 2x1 example
%
function [r,b,d] = ...
   specfac3(A,dA,B,dB,V,dV,W,dW)
[A,dA] = polmul(W,dW,A,dA);
AA = conv(A,flip(A));
[B,dB] = polmul(V,dV,B,dB);
[B1,dB1] = ext(B,dB,1,1);
B1B1 = conv(B1,flip(B1));
[B2,dB2] = ext(B,dB,2,1);
B2B2 = conv(B2,flip(B2));
d = max([dA dB1 dB2]);
diffA = d - dA;
diffB1 = d - dB1;
diffB2 = d - dB2;
[zA,dzA] = zpowk(diffA);
[AA,dAA]= polmul(AA,2*dA,zA,dzA);
[zB1,dzB1] = zpowk(diffB1);
[B1B1,dB1B1] = polmul(B1B1,2*dB1,zB1,dzB1);
[zB2,dzB2] = zpowk(diffB2);
[B2B2,dB2B2] = polmul(B2B2,2*dB2,zB2,dzB2);
[ApB,dApB] = poladd(AA,dAA,B1B1,dB1B1);
[ApB,dApB] = poladd(ApB,dApB,B2B2,dB2B2);
rts = roots(ApB);
rtsin = rts(d+1:2*d);
b = 1;
for i = 1:d,
    b = conv(b,[1 -rtsin(i)]);
end
br = flip(b);
bbr = conv(b,br);
r = ApB(1) / bbr(1);
