% LQG controller design by the method of Ahlen and Sternad
% function [R,dR,S,dS] = ...
% lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF)
%
function [R,dR,S,dS] = ...
lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF)

[r,b,db] = specfac(A,dA,B,dB,rho,V,dV,W,dW,F,dF);
WFA = flip(conv(A,conv(F,W)));
dWFA = dW + dF + dA;
[rhs1,drhs1] = polmul(W,dW,WFA,dWFA);
[rhs1,drhs1] = polmul(rhs1,drhs1,C,dC);
rhs1 = rho * rhs1;
rhs2 = conv(C,conv(V,flip(conv(B,V))));
drhs2 = dC + 2*dV + dB;
for i = 1:db-dB-dV,
  rhs2 = conv(rhs2,[0,1]);
end
drhs2 = drhs2 + db-dB-dV;
C1 = zeros(1,2);
[C1,dC1] = putin(C1,0,rhs1,drhs1,1,1);
[C1,dC1] = putin(C1,dC1,rhs2,drhs2,1,2);

[Cg,Cb] = polsplit(C);
dCb = length(Cb)-1;
rbf = r * flip(b);
[rbfCb,drbfCb] = polmul(rbf,db,Cb,dCb);
D1 = zeros(2);
[D1,dD1] = putin(D1,0,rbfCb,drbfCb,1,1);
[zk,dzk] = zpowk(k);
[rbfCbzk,drbfCbzk] = polmul(rbfCb,drbfCb,zk,dzk);
[D1,dD1] = putin(D1,dD1,rbfCbzk,drbfCbzk,2,2);

N = zeros(1,2);
[N,dN] = putin(N,0,-B,dB,1,1);
[AF,dAF] = polmul(A,dA,F,dF);
[N,dN] = putin(N,dN,AF,dAF,1,2);
[Y,dY,X,dX] = xdync(N,dN,D1,dD1,C1,dC1);
[R,dR] = ext(X,dX,1,1);
[S,dS] = ext(X,dX,1,2);
X = flip(Y);
