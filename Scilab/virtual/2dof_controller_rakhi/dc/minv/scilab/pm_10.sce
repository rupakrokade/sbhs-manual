// Updated(18-7-07)
// 11.3

C = [1 0.5]; dC = 1; j=2;
A = [1 -0.6 -0.16]; dA = 2;
zj = zeros(1,j+1); zj(j+1) = 1;
[Fj,dFj,Ej,dEj] = xdync(zj,j,A,dA,C,dC)
