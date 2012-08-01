D = conv([1 -1.7 1],[1 -1]);
dD = 3;
N = [0 0 -1 2];
dN = 3;
C = [1 -0.6];
dC = 1;
[Y,dY,X,dX] = xdync(N,dN,D,dD,C,dC);
C1 = [1 -1.8 0.819]; dC1 = 2;
