% MacGregor Viscosity control problem
A = [1 -2.85 2.695 -0.8454]; dA = 3; C = A; dC = dA;
B = [-0.0005866 3.308e-5 0.0005522]; dB = 2;
k = 1; int = 0; cont = 0; F = 1; dF = 0;
V = 1; W = [1 -1]; dV = 0; dW = 1; 
u_lqg = []; y_lqg =[]; uy_lqg = [];
%for rho = 0.1:0.1:10,
rho = 0.1;
    [R,dR,S,dS] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int,cont);
    u_lqg = [u_lqg uvar]; y_lqg = [y_lqg yvar];
    uy_lqg = [uy_lqg; [rho uvar yvar]];
%end
%plot(u_lqg,y_lqg,'g')
%save -ASCII ../figures/lqg_pend_p1.dat uy_lqg
