N = [0  4 0 1
       -1 8 0 3]
dN = 1
D = [0 0  1 4 0 1
       0 0 -1 0 0 0]
dD = 2
C = [1 0 1 1
     0 2 0 1]
dC = 1
[Y,dY,X,dX,B,dB,A,dA] = xdync(N,dN,D,dD,C,dC)
