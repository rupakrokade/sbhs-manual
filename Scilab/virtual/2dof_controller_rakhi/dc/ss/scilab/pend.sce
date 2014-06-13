// Updated(19-7-07)
// 14.1
// A,B are available from code 2.1

getf pol2cart.sci;
C = eye(4,4);
D = zeros(4,1);
Ts = 0.01;
G = syslin('c',A,B,C,D);
H = dscr(G,Ts);
[a,b,c,d] = H(2:5);
rise = 5; epsilon = 0.1;
N = rise/Ts;
omega = %pi/2/N;
r = epsilon^(omega/%pi); 
r1 = r; r2 = 0.9*r;
[x1,y1] = pol2cart(omega,r1);
[x2,y2] = pol2cart(omega,r2);
p1 = x1+%i*y1;
p2 = x1-%i*y1;
p3 = x2+%i*y2;
p4 = x2-%i*y2;
P = [p1;p2;p3;p4];
K = ppol(a,b,P)
