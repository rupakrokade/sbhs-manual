% Camacho and Bordon's GPC example; Control law
%
A=[1 -0.8]; dA=1; B=[0.4 0.6]; dB=1; N=3; k=1; rho=0.8;
[K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
gpc_bas(A,dA,B,dB,N,k,rho)
% C=1; dC=0; [K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
% gpc_col(A,dA,B,dB,C,dC,N,k,rho)
