// // Use of Moudgalya's software for generating the LG performance curves
// // for the examples given by Julien et al. (2004)
// // *************************************************************************
// // *************************************************************************
// // M. Jelali, 20 November 2007
// //


// Process model from Julien et al. (2004), Equation 19

A = convol([1 -0.7],[1 0.9]); dA = 2; 
B = convol([0.079 0.221],[1 0.9]); 
dB = 2;
C = [1 -0.7]; dC = 1; 
k = 2; int = 1; 
F = [1 -1]; dF = 1;
V = 1; W = 1; dV = 0; dW = 0; 
u_lqg = []; y_lqg =[]; uy_lqg = [];

getf lqg.sci;
rho = 0.1;
    [R1,dR1,Sc,dSc] = lqg(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
    [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,Sc,dSc,R1,dR1,int);
