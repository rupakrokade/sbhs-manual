// Updated(19-7-07)
// 13.8
// Solves Example 3.1 of Ahlen and Sternad in Hunt's book

A = [1 -0.9]; dA = 1; B = [0.1 0.08]; dB = 1; 
k = 2; rho = 0.1; C = 1; dC = 0;
V = 1; dV = 0; F = 1; dF = 0; W = [1 -1]; dW = 1;

getf lqg1.sci;
[R1,dR1,Sc,dSc] = ...
lqg1(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF)
