mode(0)
function temp = step_test(heat,fan)
    temp = comm(heat,fan);
    
    plotting([heat fan temp],[],[])
    
    m=m+1;
endfunction

