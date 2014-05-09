D = [1 2 -8]; dD = 2;
N = [0 1 -3]; dN = 2;
phi = [1 -1.7607 0.7944]; dphi = 2;
[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi)
S1 =
   -2.6945    2.8431
dS1 =
     1
R1 =
    1.0000   -1.0662
dR1 =
     1
conv(D,R1)+conv(N,S1)
ans =
    1.0000   -1.7607    0.7944         0
diary off
