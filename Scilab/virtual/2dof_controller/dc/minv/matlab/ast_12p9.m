A = conv([1 -1],[1 -0.7]); dA = 2;
B = [0.9 1]; dB = 1; k = 1;
C = [1 -0.7]; dC = 1; int = 0;
[Sc,dSc,Rc,dRc] = mv_nm(A,dA,B,dB,C,dC,k,int)
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int);
