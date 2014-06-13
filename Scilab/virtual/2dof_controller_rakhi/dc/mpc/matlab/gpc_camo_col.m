% Camacho Example
A = [1 -0.8]; dA = 1; B = [0.4 0.6]; dB = 1;
C = [1 -0.8]; dC = 1; k = 1; int = 1; cont = 1;
N = 2; 
u_gpc = []; y_gpc = []; uy_gpc = [];
for rho = 1.0e-5:0.01:0.1,
% rho = 0.04
    [K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int,cont);
    u_gpc = [u_gpc uvar]; y_gpc = [y_gpc yvar]; 
    uy_gpc = [uy_gpc; [rho uvar yvar]];
end
plot(u_gpc,y_gpc,'r')
save -ASCII perf_figures/gpc_camo.dat uy_gpc

% function [K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int)
% implements the Generalized Predictive Controller
% if int>=1, integrated noise is assumed; otherwise,
% it is not integrated noise
%
function [K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int)
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
    [Gj,dGj] = polmul(Mj,dMj,Ej,dEj);
    [Gj,dGj] = polmul(Gj,dGj,B,dB);
    [Pj,dPj] = polmul(Mj,dMj,Fj,dFj);
    [Pj,dPj] = poladd(Nj,dNj,Pj,dPj);
    G(j,1:j) = flip(Gj(1:j));
    H1(j,1:dGj-j+1) = Gj(j+1:dGj+1); 
    H2(j,1:dPj+1) = Pj;
end
K = inv(G'*G+rho*eye(Nu))*G';
KH1 = K * H1;
KH2 = K * H2;
R = [1 KH1(1,:)]; dR = length(R)-1;
S = KH2(1,:); dS = length(S)-1;
