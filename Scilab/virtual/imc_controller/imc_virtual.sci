mode(0)


function [stop] = imc_virtual(setpoint,fan,alpha)

global temp heat C0 u_old u_new e_old e_new fdfh fdt fncr fncw m err_count stop q heatdisp fandisp tempdisp setpointdisp limits m x sampling_time e_old_old

e_new = setpoint - temp;

b=((1-alpha)/0.01163);
u_new = u_old + b*(e_new - (0.9723*e_old));


heat=u_new;
u_old = u_new;
e_old = e_new;


    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp setpoint],[0 0 30 0],[100 100 50 1000])
    
endfunction


