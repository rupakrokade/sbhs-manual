% finds the value of a polynomial in powers of z^{-1}
% function Y = filtval(P,z)

function Y = filtval(P,z)

N = length(P)-1;
Y = polyval(P,z)/z^N; 
