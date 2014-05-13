// Updated(19-7-07)
// 13.10
// MacGregor's first control problem

A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int1 = 0;
u_gmv = []; y_gmv = []; uy_gmv = [];

getf gmv.sci;
for rho = 0:0.1:10,
    [S,dS,R,dR] = gmv(A,dA,B,dB,C,dC,k,rho,int1);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int1);
    u_gmv = [u_gmv uvar]; y_gmv = [y_gmv yvar]; 
    uy_gmv = [uy_gmv; [rho uvar yvar]];
end
plot(u_gmv,y_gmv,'b')

