%Set up the model for simulation
arma_mod = idpoly(1,0,[1 -0.4],[1 -0.7],1,1);
% Generate the inputs for simulation
u = zeros(2048,1); % Deterministic Input can be anything
e = randn(2048,1);

% Simulate the model
y = idsim(arma_mod,[u e]);
% Plot ACF and PACF for 20 lags
figure; subplot(211); plotacf(y,1e-03,21,1); 
subplot(212); pacf(y,21);
% Estimate AR(1) model and present it
mod_est = armax(y,[1 0]); present(mod_est)
% compute the residuals
err_mod = pe(mod_est,y);
% Check using ACF and PACF of residuals and estimate the appropriate parameters 
% if necessary
mod_est = armax(y,[1 1]); present(mod_est);
err_mod = pe(mod_est,y);
% Check ACF and PACF of residuals
% Plot ACF and PACF for 20 lags
figure; subplot(211); plotacf(err_mod,1e-03,21,1); 
subplot(212); pacf(err_mod,21);

