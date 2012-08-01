xi = 0.1*randn(10000,1);

% Simulation and estimation of first model
m1 = idpoly(1,[],[1,-3,1.25]);
v1 = sim(m1,xi);
M1 = armax(v1,[0 2]);
present(M1)

% Simulation and estimation of second model
m2 = idpoly(1,[],[1,-0.9,0.2]);
v2 = sim(m2,xi);
M2 = armax(v2,[0 2]);
present(M2)

% ACF and PACF of both models
figure, plotacf(v1,1,11,1); 
figure, plotacf(v2,1,11,1);
figure, pacf(v1,11);
figure, pacf(v2,11);


