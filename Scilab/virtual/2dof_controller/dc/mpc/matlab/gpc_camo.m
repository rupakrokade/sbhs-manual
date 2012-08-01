% Camacho Example
A = [1 -0.8]; dA = 1; B = [0.4 0.6]; dB = 1;
C = 1; dC = 0; k = 1; int = 1; cont = 1;
N = 3; 
rho = 0.8;
[K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
    cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
