mode(0)
function [temp] = mpc(Tsp,fan)
global temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old

global heatdisp fandisp tempdisp setpointdisp sampling_time m name
//heats = 1;
u_new = mpc_run(temp,heats,Tsp);


heat = u_new;

    temp = comm(heat,fan);
    
    plotting([heat fan temp Tsp],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction

