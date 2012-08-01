function r=find_model(na,nc)

prj=load('proj1.mat');
y=prj.y1;

% Plot ACF and PACF for 10 lags
figure, plotacf(y,1e-03,11,1); 
title('ACF of given data',...
        'FontSize',14)
figure, pacf(y,10);
title('PACF of given data',...
        'FontSize',14)
    
% Estimate model and present it
mod_est1 = armax(y,[na nc]); present(mod_est1)

% compute the residuals
err_mod1 = pe(mod_est1,y);

% Plot ACF and PACF for 10 lags
figure
title(['ACF of ARMA(' num2str(na) ',' num2str(nc) ')'],...
        'FontSize',14)
plotacf(err_mod1,1e-03,11,1); 
figure, pacf(err_mod1,10);
title(['PACF of ARMA(' num2str(na) ',' num2str(nc) ')'],...
        'FontSize',14)      

end
