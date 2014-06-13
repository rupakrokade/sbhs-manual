load proj1.mat
y=y4;
% Plot ACF and PACF for 10 lags
  figure, plotacf(y,1e-03,10,1);
  figure, pacf(y,10);
  
  mod_est1 = armax(y,[0 3]); present(mod_est1);
  err_mod1 = pe(mod_est1,y);
  figure, plotacf(err_mod1,1e-03,10,1);
  figure, pacf(err_mod1,10);
