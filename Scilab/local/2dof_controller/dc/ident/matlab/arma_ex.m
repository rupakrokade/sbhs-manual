% Set up the model for simulation
arma_mod = idpoly(1,0,[1 -0.3],[1 -0.8],1,1);

% Generate the inputs for simulation
% Deterministic Input can be anything
u = zeros(2048,1); 
e = randn(2048,1);

% Simulate the model
v = sim([u e],arma_mod);

% Plot ACF and PACF for 10 lags
figure, plotacf(v,1e-03,11,1); 
figure, pacf(v,10);

% Estimate AR(1) model and present it
mod_est1 = armax(v,[1 0]); present(mod_est1)

% compute the residuals
err_mod1 = pe(mod_est1,v);

% Plot ACF and PACF for 10 lags
figure, plotacf(err_mod1,1e-03,11,1); 
figure, pacf(err_mod1,10);

% Check ACF and PACF of residuals 
mod_est2 = armax(v,[1 1]); present(mod_est2)
err_mod2 = pe(mod_est2,v);

% Plot ACF and PACF for 10 lags
figure, plotacf(err_mod2,1e-03,11,1); 
figure, pacf(err_mod2,10);
