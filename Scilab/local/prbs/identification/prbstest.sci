mode(0)
function [temp] = prbstest(heat,fan)
global heatdisp fandisp tempdisp setpointdisp sampling_time m name


    temp = comm(heat,fan);
    
    plotting([heat fan temp],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction

