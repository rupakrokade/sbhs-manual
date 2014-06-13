// Updated(3-8-07)
// 6.7

xi = 0.1*rand(1,10000);

// Simulation and estimation of first model
m1 = armac(1,0,[1,-3,1.25],1,1,1);
v1 = arsimul(m1,xi);
M1 = armax1(0,0,2,v1,zeros(1,10000))

// Simulation and estimation of second model
m2 = armac(1,0,[1,-0.9,0.2],1,1,1);
v2 = arsimul(m2,xi);
M2 = armax1(0,0,2,v2,zeros(1,10000))

// ACF and PACF of both models
getf plotacf.sci;
getf pacf.sci;
plotacf(v1,1,11,1); 
xset('window',1), plotacf(v2,1,11,1);
xset('window',2), pacf(v1,11);
xset('window',3), pacf(v2,11);

