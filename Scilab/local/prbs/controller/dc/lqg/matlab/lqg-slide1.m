% MacGregor Viscosity control problem
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; F = [1 -1]; dF = 1;
V = 1; W = 1; dV = 0; dW = 0; 
rho = 1;
[R1,dR1,S,dS] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
