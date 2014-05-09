% MacGregor first control problem, with F = 1-0.9/z
% As A and B do not have common factors, solved using (6.13) of Sternads
% notes.
clear
A = [1 -0.5]; dA = 1; C = [1 -0.5]; dC = 1;
% B = 0.5; dB = 0; k = 1; F = [1 -0.9]; dF = 1;
B = 0.5; dB = 0; k = 1; F = 1; dF = 0;
V = 1; W = 1; dV = 0; dW = 0; int = 0;
rho = 1;
[R,dR,S,dS] = lqg_simple(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
