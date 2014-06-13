% MacGregor's Viscosity control problem
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int = 1;
N = 9; u_gpc = []; y_gpc = []; uy_gpc = [];
for rho = 1.0e-3:0.1:2,
    [K,KH1,KH2,S,dS,R,dR] = gpc(A,dA,B,dB,C,dC,N,k,rho,int);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
    u_gpc = [u_gpc uvar]; y_gpc = [y_gpc yvar];
    uy_gpc = [uy_gpc; [rho uvar yvar]];
end
figure
plot(u_gpc,y_gpc,'r')
% save -ASCII gpc_visc.dat uy_gpc
