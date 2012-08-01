// Updated(18-7-07)
// 11.2

C = [1 0.5]; dC = 1;
A = [1 -0.6 -0.16]; dA = 2;
j = 2;
getf recursion.sci
[Fj,dFj,Ej,dEj] = recursion(A,dA,C,dC,j)

