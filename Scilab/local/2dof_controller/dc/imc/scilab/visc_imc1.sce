// Updated(18-7-07)
// 10.6
// Kannan Moudgalya, April 2004

B = [0.51 1.21];
A = [1 -0.44];
k = 1;
alpha = 0.5;

getf imc_stable1.sci;
[k,GiN,GiD] = imc_stable1(B,A,k,alpha);

[zk,dzk] = zpowk(k);
Bp = B; Ap = A; 
Ts = 0.1; t0 = 0; tf = 20; Nvar = 0.01;


