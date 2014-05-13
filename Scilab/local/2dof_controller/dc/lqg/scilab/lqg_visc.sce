// Updated(19-7-07)
// 13.6
// Viscosity control problem of MacGregor

A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int1 = 1; F = [1 -1]; dF = 1;
V = 1; W = 1; dV = 0; dW = 0; 
rho = 1;

getf lqg.sci;
[R1,dR1,Sc,dSc] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
    cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int1);
