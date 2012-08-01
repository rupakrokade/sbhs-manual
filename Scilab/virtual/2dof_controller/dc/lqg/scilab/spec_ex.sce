// Updated(19-7-07)
// 13.1

A = convol([-0.5 1],[-0.9 1]); dA = 2;
B = 0.5*[-0.9 1]; dB = 1; rho = 1;
getf spec1.sci;
[r,beta1,sigma] = spec1(A,dA,B,dB,rho)
