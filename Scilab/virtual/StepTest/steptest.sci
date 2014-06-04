function [stop] = steptest(heat,fan)
    
    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp],[0 0 30 0],[100 100 50 1000])
    
endfunction