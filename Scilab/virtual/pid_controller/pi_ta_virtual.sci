mode(0);
//PI Controller using trapezoidal approximation.
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

function [stop] = pi_ta_virtual(setpoint,fan,K,Ti)

global temp heat C0 u_old u_new e_old e_new fdfh fdt fncr fncw m err_count stop q heatdisp fandisp tempdisp setpointdisp limits m x sampling_time

e_new = setpoint - temp;

Ts=sampling_time;
S0=K(1+Ts/(2*Ti));
S1=K*(-1+(Ts/(2*Ti)));
u_new = u_old+(S0*e_new)+(S1*e_old);

heat=u_new;

u_old = u_new;
e_old = e_new;

    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp setpoint],[0 0 30 0],[100 100 50 1000])

endfunction


