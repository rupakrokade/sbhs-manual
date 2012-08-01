F = [0 1 0; 0 -1 1; 0 0 4]; G = [0; 0; 1];
C = [1 0 0]; D = 0;
sysc = ss(F,G,C,D);
Ts = 0.1;
sys = c2d(sysc,Ts);
[A,b,c,d] = ssdata(sys);
CO = ctrb(A,b);
[row,col] = size(F);
w = CO\A^3;
K = w(row,:);
Acl = A-b*K;
x0 = [1;1;2];
x1 = Acl*x0, x2 = Acl*x1, x3 = Acl*x2
