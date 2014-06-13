% MacGregor's Viscosity control problem
%
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int = 1;
u_gmv = []; y_gmv = []; uy_gmv = [];
for rho = 0.5:0.1:10,
    [S,dS,R,dR] = gmv(A,dA,B,dB,C,dC,k,rho,int);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
    u_gmv = [u_gmv uvar]; y_gmv = [y_gmv yvar]; 
    uy_gmv = [uy_gmv; [rho uvar yvar]];
end
plot(u_gmv,y_gmv,'b')
save -ASCII gmv_visc.dat uy_gmv
