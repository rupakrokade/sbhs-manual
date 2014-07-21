function [stop] = pid_bda_tuned_dist(setpoint,fan)
    
    global u_old u_new e_old e_old_old e_new S0 S1 temp
    
    L = 6;
    R = (0.016*temp-0.114)/(66.90-0.415*temp);
    K = 1.2/(R*L)
    Ti = 2*L;
    Td = 0.5*L;
    
    e_new = setpoint - temp;

    Ts=sampling_time;
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
