function [stop] = ramptest(heat,fan)
    
    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp]);
    
endfunction