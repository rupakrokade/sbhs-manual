% function [B,A,k] = myc2d(G,Ts)
% Produces numerator and denominator of discrete transfer 
% function in powers of z^{-1}
% G is continuous transfer function, it can have time delays
% Ts is the sampling time, all in consistent time units

function [B,A,k] = myc2d(G,Ts)
H = c2d(G,Ts,'zoh');
[num,A] = tfdata(H,'v');
nonzero = find(num);
first_nz = nonzero(1);
k = first_nz-1 + H.ioDelay;
B = num(first_nz:length(num)); 