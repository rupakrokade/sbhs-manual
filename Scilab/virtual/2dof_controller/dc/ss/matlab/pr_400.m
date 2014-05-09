CO = ctrb(A,b);
[row,col] = size(A);
w = CO\A*(A-0.5*eye(2));
K = w(row,:)

A = [1 1; 1 1]; b = [1; 0];
p = [0 0.5];
K = place(A,b,p)
