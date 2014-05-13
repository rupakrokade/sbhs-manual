% GPC control of viscosity problem
%
A=[1 -0.44]; degA=1; B=[0.51 1.21]; degB=1; Nu=3; k=1;
D=[1 -1]; degD=1; AD=conv(A,D); degAD=degA+1;
C = [1 -0.44]; degC = 1; N = Nu-1
zj=1; degzj=0; G=zeros(Nu); H1=zeros(Nu,2*k+N-2+degB);
H2 = zeros(Nu,k+N+degA);
for j = 1:Nu,
    zj = conv(zj,[0,1]); degzj = degzj + 1;
    [Fj,degFj,Ej,degEj] = ...
        xdync(zj,degzj,AD,degAD,C,degC);
    [Nj,degNj,Mj,degMj] = ...
        xdync(zj,degzj,C,degC,1,0);
    [Gj,degGj] = polmul(Mj,degMj,Ej,degEj);
    [Gj,degGj] = polmul(Gj,degGj,B,degB);
    [Pj,degPj] = polmul(Mj,degMj,Fj,degFj);
    [Pj,degPj] = poladd(Nj,degNj,Pj,degPj);
    j,Fj,Ej,Mj,Nj,Gj,Pj
    G(j,1:j) = flip(Gj(1:j));
    H1(j,1:degGj-j+1) = Gj(j+1:degGj+1); 
    H2(j,1:degPj+1) = Pj;
end
G,H1,H2
rho = 1
K = inv(G'*G+rho*eye(Nu))*G'
K * [H1 H2]
