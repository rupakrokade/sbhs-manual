% Viscosity control problem of MacGregor
%
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int = 1;
[Sc,dSc,R1,dR1] = mv_nm(A,dA,B,dB,C,dC,k,int)
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int);
