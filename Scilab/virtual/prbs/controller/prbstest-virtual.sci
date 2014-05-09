function [stop,temp] = prbstest(heat,fan,setp)
    global scn scd tcn tcd rcn rcd gamm

    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp setp]);
    
endfunction
