function f = func_1(x)
  k = x(1);
  tau = x(2);
  y_prediction = k*(t + tau*(exp(-t/tau) - 1));  
  f = (norm(y - y_prediction,2))^2;
endfunction

function [f,g,ind1] = cost(x,ind1)
  k = x(1);
  tau = x(2);
  y_prediction = k*(t + tau*(exp(-t/tau) - 1));
  f = (norm(y - y_prediction,2))^2;
  g = numdiff(func_1,x);
endfunction
