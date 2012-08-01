function f = func_approx(x)
  k = x(1);
  tau = x(2);
  y_p_approx = k*(t_approx - tau);
  f = (norm(y_approx - y_p_approx,2))^2;
endfunction

function [f,g,ind] = cost_approx(x,ind)
  k = x(1);
  tau = x(2);
  y_p_approx = k*(t_approx - tau);
  f = (norm(y_approx - y_p_approx,2))^2;
  g = numdiff(func_approx,x);
endfunction
