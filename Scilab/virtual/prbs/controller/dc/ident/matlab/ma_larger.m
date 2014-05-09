m = idpoly(1,[],[1 -0.9 0.2]);
xi = 0.1*randn(100000,1);
v = sim(m,xi);
M1 = armax(v,[0 2]);
present(M1)
M2 = armax(v,[0 3]);
present(M2)
