C = [1 0 0 0; 0 1 0 0]; D = [0;0];
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
K = place(a,b,P);






Pe = [0.1+0.1i 0.1+0.1i 0.1-0.1i 0.1-0.1i]';
K = place(A',C',Pe);
Lp = K';
K = place(A,B,P);
H = ss(A,B,C,D,Ts);
rsys = reg(H,K,Lp);
[Ac,Bc,Cc,Dc,Ts] = ssdata(rsys);
