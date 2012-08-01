A=[1 -0.8]; dA=1; B=[0.4 0.6]; dB=1;
rho = 0.8; k = 1;
N1 = 0; N2 = 3; Nu = 2;
[K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
gpc_N(A,dA,B,dB,k,N1,N2,Nu,rho)
