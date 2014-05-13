// Updated(18-7-07)
// 11.13
// MacGregor's first control problem by gmv

A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int1 = 0;
rho = 1;

getf gmv.sci;
[Sc,dSc,Rc,dRc] = gmv(A,dA,B,dB,C,dC,k,rho,int1);

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int1);
