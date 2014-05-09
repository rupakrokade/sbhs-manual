B = [0.51 1.21];
A = [1 -0.44];
k = 1;
alpha = 0.5;
% [k,HiN,HiD,R,S] = imc_stable(B,A,k,alpha);
[k,HiN,HiD,R,S,mu] = imc(B,A,k,alpha);
[zk,dzk] = zpowk(k);
Bp = B; Ap = A;
