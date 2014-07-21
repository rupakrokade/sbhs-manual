function lsterr = order_2(t,H,T,limits,no)
x0 = [2 200 150];
//delta_u = u(2) - u(1); u = u - u(1); y = y - y(1);

delta_u = H(2)-H(1);


[f,xopt,gopt] = optim(costf_2,'b',[0 2 1],[18 300 350],x0,'ar',200,200)
kp = xopt(1); tau1 = xopt(2); tau2 = xopt(3); lsterr = sqrt(f);
y_prediction = kp * delta_u * (1 - ...
(tau1*exp(-(t)/tau1)-tau2*exp(-(t)/tau2)) ...
/(tau1-tau2));
format('v',6); ord = [T y_prediction]; x = [t t t];
//xbasc();
 plot2d(t,T);

plot2d(t,y_prediction);
title = 'Comparison of model with data (tau1='
title = title+string(tau1)+', tau2='+string(tau2)
title = title+', K='+string(kp)
title = title+', error='+string(lsterr)+')'
label(title,4,'time (s)','Change in temperature (K)',4);
endfunction;
