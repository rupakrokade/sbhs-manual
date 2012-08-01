N = conv([0 1],[1 1]);
D = conv([1 -4],[1 -1]);
dN = 2; dD = 2;
C = [1 -1 0.5];
dC = 2;
[Y,dY,X,dX,B,dB,A,dA] = xdync(N,dN,D,dD,C,dC)
