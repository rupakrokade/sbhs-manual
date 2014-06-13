m = idpoly(1,[],[1,-0.9,0.2]);
xi = 0.1*randn(100000,1);
v = sim(m,xi);
plotacf(v,1,11,1);
figure
pacf(v,11);
