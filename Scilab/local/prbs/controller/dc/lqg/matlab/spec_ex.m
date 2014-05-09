A = conv([-0.5 1],[-0.9 1]); dA = 2;
B = 0.5*[-0.9 1]; dB = 1; rho = 1;
[r,beta,sigma] = spec(A,dA,B,dB,rho)
