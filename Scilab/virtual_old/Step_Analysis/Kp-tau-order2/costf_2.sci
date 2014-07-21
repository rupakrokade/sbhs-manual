function [f,g,ind] = costf_2(x,ind)
kp = x(1); tau1 = x(2); tau2 = x(3);
y_prediction = kp * delta_u * (1 - ...
(tau1*exp(-(t)/tau1)-tau2*exp(-(t)/tau2)) ...
/(tau1-tau2));
f = (norm(T-y_prediction,2))^2;
g = numdiff(func_2,x);
endfunction;
function f = func_2(x)
kp = x(1); tau1 = x(2); tau2 = x(3);
y_prediction = kp * delta_u * (1 - ...
(tau1*exp(-(t)/tau1)-tau2*exp(-(t)/tau2)) ...
/(tau1-tau2));
f = (norm(T-y_prediction,2))^2;
endfunction;
