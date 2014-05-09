num = 1; den = [-1 1]; Ts = 1;
G = tf(num,den);
[Btilde,Atilde,k] = myc2d(G,Ts);
alpha = 0.9;
[k,HiN,HiD,R,S,mu] = imc(Btilde,Atilde,k,alpha);
[zk,dzk] = zpowk(k);
B = Btilde; A = Atilde;
