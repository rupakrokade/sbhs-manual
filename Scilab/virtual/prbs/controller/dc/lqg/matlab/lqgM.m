%G1 = tf(1,[1 1]);
%G2 = tf(1,[1 -1]);
rho = 1;
Ts = 1;
[b1,a1,k] = myc2d(G1,Ts);
db1 = length(b1)-1; da1 = length(a1)-1;
[zk,dzk] = zpowk(k);
[b1,db1] = polmul(b1,db1,zk,dzk);
[b1,db1,a1,da1] = left_prm(b1,db1,a1,da1);
Num = zeros(2,1); dNum = 0;
Den = zeros(2,1); dDen = 0;
[Num,dNum] = putin(Num,dNum,b1,db1,1,1);
[Den,dDen] = putin(Den,dDen,a1,da1,1,1);
[b2,a2,k2] = myc2d(G2,Ts);
db2 = length(b2)-1; da2 = length(a2)-1;
[zk2,dzk2] = zpowk(k2);
[b2,db2] = polmul(b2,db2,zk2,dzk2);
[b2,db2,a2,da2] = left_prm(b2,db2,a2,da2);
[Num,dNum] = putin(Num,dNum,b2,db2,2,1);
[Den,dDen] = putin(Den,dDen,a2,da2,2,1);
[B,dB,A,dA] = rat2lmfd(Num,dNum,Den,dDen);
[B1,dB1,A1,dA1] = l2r(B,dB,A,dA);
B1 = B1/norm(A1); A1 = A1/norm(A1);
[r,Dc,dDc] = specfac2(A1,dA1,B1,dB1,rho);
[A11,dA11] = ext(A,dA,1,1);
[r1,Df11,dDf11] = specfac(A11,dA11,0,0,1,1,0,1,0,1,0);
[A22,dA22] = ext(A,dA,2,2);
[r2,Df22,dDf22] = specfac(A22,dA22,0,0,1,1,0,1,0,1,0);
Df = zeros(2); dDf = 0;
[Df,dDf] = putin(Df,dDf,Df11,dDf11,1,1);
[Df,dDf] = putin(Df,dDf,Df22,dDf22,2,2);
D2 = Df; dD2 = dDf;
[B2,dB2,D3,dD3] = l2r(B,dB,Df,dDf);
B2 = B2/norm(D3); D3 = D3/norm(D3);
[B1r,dB1r] = flipM(B1,dB1);
[L1r,dL1r] = polmul(B1r,dB1,D2,dD2);
A1r = flip(A1);
[L2r,dL2r] = polmul(A1r,dA1,D3,dD3);
L2r = rho^2 * L2r;
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
[Y,dY,X,dX] = xdync(N,dN,D,dD,C,dC);
[G0,dG0,H0,dH0] = colsplit(X,dX,2,1);
G0 = real(G0); H0 = real(H0);
%
[rD2,cD2] = polsize(D2,dD2);
[rD3,cD3] = polsize(D3,dD3);
[D41,dD41] = coljoin(D2,dD2,zeros(rD2,cD3),0);
[D42,dD42] = coljoin(zeros(rD3,cD2),0,D3,dD3);
[D4,dD4] = rowjoin(D41,dD41,D42,dD42);
[N4,dN4] = coljoin(G0,dG0,H0,dH0);
[N0,dN0,D0,dD0] = left_prm(N4,dN4,D4,dD4);
[G1,dG1,H1,dH1] = colsplit(N0,dN0,2,1);
[G2,dG2,H2,dH2] = l2r(G1,dG1,H1,dH1);
G2 = G2/norm(H2); H2 = H2/norm(H2);
[AH2,dAH2] = polmul(A,dA,H2,dH2);
[BG2,dBG2] = polmul(B,dB,G2,dG2);
[AH2,dAH2] = poladd(AH2,dAH2,BG2,dBG2);
[G3,dG3,H3,dH3] = left_prm(AH2,dAH2,H2,dH2);
[TN,dTN] = polmul(H3,dH3,A,dA);
[pTN,dpTN] = poldet(TN,dTN);
[pTD,dpTD] = poldet(G3,dG3);
zeros = roots(pTN)
poles = roots(pTD)
