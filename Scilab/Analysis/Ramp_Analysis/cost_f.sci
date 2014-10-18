

function [f,g,ind1] = cost_f(x,ind1)
  k = x(1);
  tau = x(2);
 y_prediction = k*(t + tau*(exp(-t/tau) - 1));
 //  y_prediction = k*(t );  
  f = (norm(y - y_prediction,2))^2;
  g = numdiff(func_1,x);
endfunction

function f = func_1(x)
  k = x(1);
  tau = x(2);
  y_prediction = k*(t + tau*(exp(-t/tau) - 1));  
 // y_prediction = k*(t );  
  f = (norm(y - y_prediction,2))^2;
endfunction