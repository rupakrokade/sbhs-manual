% Simple problem to test GPC law.
A = [1 -0.5]; dA = 1; B = [1 2]; dB = 1;
% C = [1 -0.5]; dC = 1; k = 1; int = 1;
C = 1; dC = 0; k = 1; int = 1;
N = 2; 
rho = 1;
[K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
    cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
