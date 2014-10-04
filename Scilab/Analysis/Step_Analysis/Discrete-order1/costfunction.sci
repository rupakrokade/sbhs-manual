function [f,g,ind] = costfunction(x,ind)
    global delay;
    y_prediction = first_order(u, x);
    if size(y) ~= size(y_prediction) then
        y_prediction = y_prediction';
    end
    f = (norm(y-y_prediction,2))^2;
    g = numdiff(func_1,x);
endfunction

function f = func_1(x)
    global delay;
    y_prediction = first_order(u, x);
    if size(y) ~= size(y_prediction) then
        y_prediction = y_prediction';
    end
    f = (norm(y-y_prediction,2))^2;
endfunction

