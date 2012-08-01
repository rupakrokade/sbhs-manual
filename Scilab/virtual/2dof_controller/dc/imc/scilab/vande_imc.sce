// Updated(24-7-07)
// 10.10
// Kannan Moudgalya, April 2004

num = [-1.117 3.1472]; den = [1 4.6429 5.3821];

G = trfu(num,den);
Ts = 0.1;

[B,A,k] = myc2d(G,Ts);
alpha = 0.5;

getf imc_stable.sci;
[k,HiN,HiD,R,S] = imc_stable(B,A,k,alpha);

[zk,dzk] = zpowk(k);
Bp = B; Ap = A;





