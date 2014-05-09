function lsterr = approx_ramp(T,u,y,input_slope,tau,limits,no)
t0 = T(1);delta_u = u(2) - u(1);
u = u - u(1); y = y - y(1);
y_prediction = gain*input_slope*((T-t0)-tau+tau*(exp(-(T-t0)/tau)));
format('v',6);
lsterr = norm(y-y_prediction,2);
ord = [u y y_prediction]; x = [T T T];
xbasc(); plot2d(x,ord,rect=limits), xgrid();
title = 'Comparison of model with data (tau='
title = title+string(tau)+', K= '+string(gain)+',error='+string(lsterr)+')'
label(title,4,'time (s)','Change in temperature (K)',4);
