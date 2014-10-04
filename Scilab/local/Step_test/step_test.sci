mode(0)
function temp = step_test(heat,fan)
    temp = comm(heat,fan);
    
    plotting([heat fan temp],[20 0 25 0],[50 100 40 1000])
    
    m=m+1;
endfunction

