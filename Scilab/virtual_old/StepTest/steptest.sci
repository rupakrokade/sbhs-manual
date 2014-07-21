function [stop] = steptest(heat,fan)
    
    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp],[0 0 25 0],[100 100 50 1000])
    
endfunction