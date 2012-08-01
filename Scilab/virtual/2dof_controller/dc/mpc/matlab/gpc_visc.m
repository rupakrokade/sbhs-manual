% MacGregor's Viscosity control problem
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int = 1;
N = 2; 
rho = 1;
[K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
    cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
