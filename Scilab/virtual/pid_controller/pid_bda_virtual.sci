mode(0);
//PI Controller using trapezoidal approximation.
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

function [stop] = pid_bda_virtual(setpoint,fan,K,Ti,Td)

global temp heat C0 u_old u_new e_old e_new fdfh fdt fncr fncw m err_count stop q heatdisp fandisp tempdisp setpointdisp limits m x sampling_time e_old_old

e_new = setpoint - temp;


Ts=1;
S0=K*(1+(Ts/Ti)+(Td/Ts));
S1=K*(-1-((2*Td)/Ts));
S2=K*(Td/Ts);

u_new = u_old + S0*e_new + S1*e_old + S2*e_old_old;

heat=u_new;

u_old = u_new;
e_old_old = e_old;
e_old = e_new;

    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp setpoint],[0 0 30 0],[100 100 50 1000])

endfunction


