// Updated(19-7-07)
// 13.5
// MacGregor's first control problem

A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int1 = 0; F = 1; dF = 0;
V = 1; W = 1; dV = 0; dW = 0;
rho = 1;

getf lqg1.sci;
[R1,dR1,Sc,dSc] = lqg1(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF)

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
      cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int1);
