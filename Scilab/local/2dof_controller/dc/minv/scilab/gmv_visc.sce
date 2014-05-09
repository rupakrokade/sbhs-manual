// Updated(18-7-07)
// 11.14
// MacGregor's Viscosity control problem by gmv

A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int1 = 1;
rho = 1;

getf gmv.sci;
[Sc,dSc,R1,dR1] = gmv(A,dA,B,dB,C,dC,k,rho,int1);

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int1);

