% MacGregor's Viscosity control problem
A = [1 -0.44]; dA = 1; B = [0.51 1.21]; dB = 1;
C = [1 -0.44]; dC = 1; k = 1; int = 1; F = [1 -1]; dF = 1;
V = 1; W = 1; dV = 0; dW = 0; 
u_lqg = []; y_lqg =[]; uy_lqg = [];
for rho = 0.001:0.1:3,
    [R1,dR1,Sc,dSc] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int);
    u_lqg = [u_lqg uvar]; y_lqg = [y_lqg yvar];
    uy_lqg = [uy_lqg; [rho uvar yvar]];
end
plot(u_lqg,y_lqg,'g')
save -ASCII lqg_visc.dat uy_lqg
