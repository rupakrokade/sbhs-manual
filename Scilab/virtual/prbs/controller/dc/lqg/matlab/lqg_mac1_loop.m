% MacGregor's first control problem
clear
A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int = 0; F = 1; dF = 0;
V = 1; W = 1; dV = 0; dW = 0;
u_lqg = []; y_lqg =[]; uy_lqg = [];
for rho = 0.1:0.1:10,
    [R,dR,S,dS] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int);
    u_lqg = [u_lqg uvar]; y_lqg = [y_lqg yvar];
    uy_lqg = [uy_lqg; [rho uvar yvar]];
end
plot(u_lqg,y_lqg,'g')
save -ASCII lqg_mac1.dat uy_lqg
