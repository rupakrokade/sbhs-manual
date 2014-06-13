% Inverted pendulum at UoA
Ts = 0.01;
cnum = [-10.7964 0 0];
cden = [1 14.7164 -46.3501 -472.8562 0];  % In matlab notation
G = tf(cnum,cden);
H = c2d(G,Ts,'zoh');
[num,A] = tfdata(H,'v');
nonzero = find(num);
first_nz = nonzero(1);
k = first_nz-1;
B = num(first_nz:length(num)); % my notation
dA = length(A)-1; dB = length(B)-1;
C = A; dC = dA;
int = 0; cont = 0; F = 1; dF = 0;
V = 1; W = 1; dV = 0; dW = 0; 
rho = 1000;
[R,dR,S,dS] = lqgu(A,dA,B,dB,C,dC,k,rho,V,dV,W,dW,F,dF);
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
        cl(A,dA,B,dB,C,dC,k,S,dS,R,dR,int,cont);
