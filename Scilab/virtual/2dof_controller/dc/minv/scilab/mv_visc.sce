// Updated(18-7-07)
// 11.11
// Viscosity control problem of MacGregor

A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int1 = 1;

getf mv_nm.sci;
[Sc,dSc,Rc,dRc] = mv_nm(A,dA,B,dB,C,dC,k,int1);

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int1);
