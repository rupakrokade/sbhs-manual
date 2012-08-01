clear 
load idmodels
A = amx3332.A; dA = length(A)-1;
B = amx3332.B; 
C = amx3332.C; dC = length(C)-1;
nz = find(B);
k = nz(1) - 1;
B = B(k+1:length(B)); dB = length(B)-1;
[zk,dzk] = zpowk(k);
Ts = 5;
int = 0; cont = 0; F = 1; dF = 0;
V = 1; W = 1; dV = 0; dW = 0; 
rho = 1;
[R,dR,S,dS] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
R = real(R); S = real(S);

