
function y=func(sampling_time)
    global a
    a=a+1;
    y=4;
    x=ceil(1/sampling_time)
    if modulo(a,x) == 1
        disp('yes')
    else
        disp('no')
    end
endfunction