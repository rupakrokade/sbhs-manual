a = [0 1 0
     980 0 -2.8
     0 0 -100];
b = [0; 0; 100];
c = [1 0 0];
d = 0;
t = 0:0.01:0.5;
x0 = [0 0 0];
p1 = -10+10j;
p2 = -10-10j;
p3 = -50;
K = place(a,b,[p1 p2 p3]);
Nbar = rscale(a,b,c,0,K);
u = 0.0001*ones(size(t));
[y,x] = lsim(a-b*K,b*Nbar,c,0,u,t,x0);
figure
plot(t,y); grid
figure
plot(t,-K*x'); grid
