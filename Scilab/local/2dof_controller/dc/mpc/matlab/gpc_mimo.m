rho = 0.05;
dimA = 2; dimB = 2;
A = zeros(dimA,dimA); dA = 0;
[A,dA] = putin(A,dA,conv([1 -1],[1 -1.8629 0.8669]),3,1,1);
[A,dA] = putin(A,dA,conv([1 -1],[1 -1.8695 0.8737]),3,2,2);
B = zeros(dimA,dimB); dB = 0;
[B,dB] = putin(B,dB,[0.0420 -0.038],1,1,1);
[B,dB] = putin(B,dB,[0.4758 -0.4559],1,1,2);
[B,dB] = putin(B,dB,[0.0582 -0.054],1,2,1);
[B,dB] = putin(B,dB,[0.1445 -0.1361],1,2,2);
Ny = 3; Nu = 2;
j = 1;
rG = Ny*dimA; cG = Nu*dimB;
G = zeros(rG,cG);
H1 = zeros(rG,dimB);
H2 = [];
for j = 1:Ny,
    [zj,dzj] = zpowk(j);
    Zj = zeros(2,2); 
    dZj = 0;
    [Zj,dZj] = putin(Zj,dZj,zj,dzj,1,1);
    [Zj,dZj] = putin(Zj,dZj,zj,dzj,2,2);
    [Fj,dFj,Ej,dEj] = xdync(Zj,dZj,A,dA,eye(2),0);
    [Gj,dGj] = polmul(Ej,dEj,B,dB);
    m = min(j,Nu);
    Gold = extc(Gj,dGj,j);
    H1 = b_dyn(H1,Gold,j,1);
    for k = 1:m,
        Gnew = extc(Gj,dGj,j-k);
        G = b_dyn(G,Gnew,j,k);
    end
    H2 = [H2
          Fj];
end
K = inv(G'*G+rho*eye(cG))*G'
KH1 = K*H1
KH2 = K*H2

