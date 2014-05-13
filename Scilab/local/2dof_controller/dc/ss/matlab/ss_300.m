A = [-1 -2 0.5; 1 0 0; 0 1 0]; b = [1; 0; 0];
CO = ctrb(A,b);
[row,col] = size(A);
w = CO\A^3;
K = w(row,:);
Acl = A-b*K;
x0 = [1;1;1];
x1 = Acl*x0, x2 = Acl*x1, x3 = Acl*x2
