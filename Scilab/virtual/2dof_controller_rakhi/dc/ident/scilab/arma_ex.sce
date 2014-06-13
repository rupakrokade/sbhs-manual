// Updated(8-8-07)
// 6.13

// Set up the model for simulation

arma_mod = armac([1 -0.8],0,[1 -0.3],1,1,1);

// Generate the inputs for simulation
// Deterministic Input can be anything
u = zeros(1,2048); 
e = rand(1,2048,'normal');

// Simulate the model
v = arsimul(arma_mod,[u e]);

getf plotacf.sci;
getf pacf.sci;

// Plot ACF and PACF for 10 lags
plotacf(v,1e-03,11,1); 
xset('window',1), pacf(v,10);

// Estimate AR(1) model and present it
// compute the residuals
[mod_est1,err_mod1] = armax1(1,0,0,v,zeros(1,length(v)));
disp(mod_est1);

// Plot ACF and PACF for 10 lags
xset('window',2), plotacf(err_mod1,1e-03,11,1); 
xset('window',3), pacf(err_mod1,10);

// Check ACF and PACF of residuals 
[mod_est2,err_mod2] = armax1(1,0,1,v,zeros(1,length(v)));
disp(mod_est2);

// Plot ACF and PACF for 10 lags
xset('window',4), plotacf(err_mod2,1e-03,11,1); 
xset('window',5), pacf(err_mod2,10);

