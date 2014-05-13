mode(0)
function [temp] = imc(setpoint,fan,alpha)
global temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old

global heatdisp fandisp tempdisp setpointdisp sampling_time m name

e_new = setpoint - temp;
b=((1-alpha)/0.01163);

u_new = u_old + b*(e_new - (0.9723*e_old));


u_old = u_new;
e_old = e_new;


heat = u_new;

    temp = comm(heat,fan);
    
    plotting([heat fan temp setpoint],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction

