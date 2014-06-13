% function [K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
% gpc(A,dA,B,dB,C,dC,N,k,rho,int)
% implements the Generalized Predictive Controller
% if int>=1, integrated noise is assumed; otherwise,
% it is not integrated noise
%
function [K,KH1,KH2,Tc,dTc,Sc,dSc,R1,dR1] = ...
gpc(A,dA,B,dB,C,dC,N,k,rho,int)
Nu = N+1; zj=1; dzj=0; G=zeros(Nu); H1=zeros(Nu,2*k+N-2+dB);
H2 = zeros(Nu,k+N+dA);
if int>=1                        % if int>=1, then integrated noise
   D=[1 -1]; dD=1; A=conv(D,A); dA=dA+1; 
end
zj = 1;
for j = 1:Nu,
    zj = conv(zj,[0 1]);
    [Fj,dFj,Ej,dEj] = xdync(zj,j,A,dA,C,dC);
    [Nj,dNj,Mj,dMj] = xdync(zj,j,C,dC,1,0);
%    [Ej,dEj,Fj,dFj] = rec(A,C,j);
%    [Mj,dMj,Nj,dNj] = rec_white(C,j);
    [Gj,dGj] = polmul(Mj,dMj,Ej,dEj);
    [Gj,dGj] = polmul(Gj,dGj,B,dB);
    [Pj,dPj] = polmul(Mj,dMj,Fj,dFj);
    [Pj,dPj] = poladd(Nj,dNj,Pj,dPj);
    G(j,1:j) = flip(Gj(1:j));
    H1(j,1:dGj-j+1) = Gj(j+1:dGj+1);
    H2(j,1:dPj+1) = Pj;
end
K = inv(G'*G+rho*eye(Nu))*G';
KH1 = K * H1; KH2 = K * H2;
R1 = [1 KH1(1,:)]; dR1 = length(R1)-1;
Sc = KH2(1,:); dSc = length(Sc)-1;
Tc = K(1,:); dTc = length(Tc)-1;
