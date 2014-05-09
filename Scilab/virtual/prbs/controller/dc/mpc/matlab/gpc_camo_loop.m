% Camacho Example
A = [1 -0.8]; dA = 1; B = [0.4 0.6]; dB = 1;
C = 1; dC = 0; k = 1; int = 1;
N = 2; 
u_gpc = []; y_gpc = []; uy_gpc = [];
for rho = 1.0e-5:0.1:10,
    [K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
    u_gpc = [u_gpc uvar]; y_gpc = [y_gpc yvar]; 
    uy_gpc = [uy_gpc; [rho uvar yvar]];
end
plot(u_gpc,y_gpc,'r')
% save -ASCII perf_figures/gpc_camo.dat uy_gpc
