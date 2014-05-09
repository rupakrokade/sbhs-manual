function [f,g,ind] = costf_1(x,ind)
kp = x(1); tau = x(2);
y_prediction = kp * ( 1 - exp(-t/tau) );
f = (norm(y-y_prediction,2))^2;
g = numdiff(func_1,x);
endfunction

function f = func_1(x)
kp = x(1); tau = x(2);
y_prediction = kp * ( 1 - exp(-t/tau) );
f = (norm(y-y_prediction,2))^2;
endfunction
