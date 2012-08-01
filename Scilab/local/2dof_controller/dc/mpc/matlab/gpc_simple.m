function [K,KH1,KH2,S,dS,R,dR] = gpc_simple(A,dA,B,dB,C,dC,N,k,rho,int)
Nu = N+1; zj=1; dzj=0; G=zeros(Nu); H1=zeros(Nu,2*k+N-2+dB);
H2 = zeros(Nu,k+N+dA);
if int>=1                        % if int>=1, then integrated noise
   D=[1 -1]; dD=1; A=conv(D,A); dA=dA+1; 
end
zj = 1;
for j = 1:Nu,
    zj = conv(zj,[0 1]);
    [Fj,dFj,Ej,dEj] = xdync(zj,j,A,dA,1,0);
%    [Ej,dEj,Fj,dFj] = rec_white(A,j);
    [Gj,dGj] = polmul(B,dB,Ej,dEj);
    G(j,1:j) = flip(Gj(1:j));
    H1(j,1:dGj-j+1) = Gj(j+1:dGj+1) 
    H2(j,1:dFj+1) = Fj;
end
K = inv(G'*G+rho*eye(Nu))*G';
KH1 = K * H1;
KH2 = K * H2;
R = [1 KH1(1,:)]; dR = length(R)-1;
S = KH2(1,:); dS = length(S)-1;
