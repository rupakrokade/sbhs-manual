G1 = tf(1,[1 1]);
G2 = tf(1,[1 -1]);
rho = 1;
Ts=1;
[b1,a1,k] = myc2d(G1,Ts);
db1 = length(b1)-1; da1 = length(a1)-1;
[zk,dzk] = zpowk(k);
[b1,db1] = polmul(b1,db1,zk,dzk);
[b2,a2,k2] = myc2d(G2,Ts);
db2 = length(b2)-1; da2 = length(a2)-1;
[zk2,dzk2] = zpowk(k2);
[b2,db2] = polmul(b2,db2,zk2,dzk2);
A = zeros(2);
dA = 0;
[A,dA] = putin(A,dA,a1,da1,1,1);
[A,dA] = putin(A,dA,a2,da2,2,2);
B = zeros(2,1); dB = 0;
[B,dB] = putin(B,dB,b1,db1,1,1);
[B,dB] = putin(B,dB,b2,db2,2,1);
[B1,dB1,A1,dA1] = l2r(B,dB,A,dA);
[r,Dc,dDc] = specfac2(A1,dA1,B1,dB1,1);
[A11,dA11] = ext(A,dA,1,1);
[r1,Df11,dDf11] = specfac(A11,dA11,0,0,1,1,0,1,0,1,0);
[A22,dA22] = ext(A,dA,2,2);
[r2,Df22,dDf22] = specfac(A22,dA22,0,0,1,1,0,1,0,1,0);
Df = zeros(2); dDf = 0;
[Df,dDf] = putin(Df,dDf,Df11,dDf11,1,1);
[Df,dDf] = putin(Df,dDf,Df22,dDf22,2,2);
D2 = Df; dD2 = dDf;
[B2,dB2,D3,dD3] = l2r(B,dB,Df,dDf);
[B1r,dB1r] = flipM(B1,dB1);
[L1r,dL1r] = polmul(B1r,dB1,D2,dD2);
A1r = flip(A1);
[L2r,dL2r] = polmul(A1r,dA1,D3,dD3);
L2r = rho * L2r;
g = max([dDc dB1 dA1]);
Dcr = flip(Dc);
diff = g - dDc;
if diff > 0,
   [zk,dzk] = zpowk(diff);
   [D1,dD1] = polmul(Dcr,dDc,zk,dzk);
else
   D1 = Dcr; dD1 = dDc;
end
   D = zeros(3);
dD = 0;
[D,dD] = putin(D,dD,D1,dD1,1,1);
[D,dD] = putin(D,dD,D1,dD1,2,2);
[D,dD] = putin(D,dD,D1,dD1,3,3);
[N,dN] = coljoin(A,dA,-B2,dB2);
diff = g - dB1;
if diff > 0,
   [zk,dzk] = zpowk(diff);
   [C1,dC1] = polmul(L1r,dL1r,zk,dzk);
else
   C1 = L1r; dC1 = dL1r;
end
diff = g - dA1;
if diff > 0,
   [zk,dzk] = zpowk(diff);
   [C2,dC2] = polmul(L2r,dL2r,zk,dzk);
else
   C2 = L2r; dC2 = dL2r;
end
[C,dC] = coljoin(C1,dC1,C2,dC2);
[Y,dY,X,dX] = xdync(N,dN,D,dD,C,dC)
