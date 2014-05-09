% GPC control of viscosity problem
%
A=[1 -0.44]; dA=1; B=[0.51 1.21]; dB=1; N=2; k=1;
C = [1 -0.44]; dC = 1; rho = 1;

[K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
gpc_col(A,dA,B,dB,C,dC,N,k,rho)
