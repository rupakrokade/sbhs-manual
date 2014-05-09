mode(0)
function temp = sine_test(heat,fan)
    temp = comm(heat,fan);
    
    plotting([heat fan temp],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction