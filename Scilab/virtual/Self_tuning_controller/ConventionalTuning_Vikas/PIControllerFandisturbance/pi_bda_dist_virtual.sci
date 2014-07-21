function [stop] = pi_bda_dist(setpoint,fan,K,Ti)
    
    global u_old u_new e_old e_new S0 S1 temp
    e_new = setpoint - temp;

    Ts=sampling_time;
    S0=K*(1+((Ts/Ti)));
    S1=-K;
    u_new = u_old + S0*e_new + S1*e_old;
    
    heat=u_new;
    
    u_old = u_new;
    e_old = e_new;
    
    [stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp setpoint],[0 0 30 0],[100 100 50 1000])
    
endfunction
