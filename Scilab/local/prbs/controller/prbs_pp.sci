mode(0)
function [temp] = prbs_pp(heat,fan, setpoint)
global heatdisp fandisp tempdisp setpointdisp sampling_time m name


    temp = comm(heat,fan);
    
    plotting([heat fan temp setpoint],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction

