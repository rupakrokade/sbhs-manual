// Updated(19-7-07)
// 12.8

A=[1 -0.44]; dA=1; B=[0.51 1.21]; dB=1;
C = [1 -0.44]; dC = 1;
k=1; N1 = 0; N2 = 2; Nu = 0; rho = 1;
getf gpc_Nc.sci;
[K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
gpc_Nc(A,dA,B,dB,C,dC,k,N1,N2,Nu,rho)

