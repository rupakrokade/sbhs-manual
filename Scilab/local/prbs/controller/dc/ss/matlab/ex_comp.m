A = [1 2; 0 3]; c = [1 0];
p = roots([1 -0.5 0.5]);
b = [0; 1];
K = place(A,b,p);

p1=0.1+0.1*j; p2=0.1-0.1*j;
phi = real(conv([1 -p1],[1 -p2]));
Obs = [c; c*A];
alphae = A^2-0.2*A+0.02*eye(2);
Lp = alphae*inv(Obs)*[0; 1];
Lp = place([1 0;2 3], ...
[1; 0],[0.1+0.1*j 0.1-0.1j]);
Lp = Lp';

C = [1 0 0.5 2;0 1 -4.71 2.8]; 
dC = 1;
[HD,dHD] = polmul(K,0,C,dC);
[HD,dHD] = polmul(HD,dHD,Lp,0);
