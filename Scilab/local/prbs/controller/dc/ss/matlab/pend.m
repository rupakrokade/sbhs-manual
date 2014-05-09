C = eye(4);
D = zeros(4,1);
Ts = 0.01;
G = ss(A,B,C,D);
H = c2d(G,Ts,'zoh');
[a,b,c,d] = ssdata(H);
rise = 5; epsilon = 0.1;
N = rise/Ts;
omega = pi/2/N;
r = epsilon^(omega/pi); 
r1 = r; r2 = 0.9*r;
[x1,y1] = pol2cart(omega,r1);
[x2,y2] = pol2cart(omega,r2);
p1 = x1+j*y1;
p2 = x2+j*y2;
p3 = x1-j*y1;
p4 = x2-j*y2;
P = [p1;p2;p3;p4];
K = place(a,b,P)

