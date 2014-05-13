mode(0)
//global temp heat fan sampling_time m heatdisp fandisp tempdisp x name 
function temp = pi_bda_tuned_dist(setpoint,fan)
global heatdisp fandisp tempdisp setpointdisp sampling_time m name temp heat_in fan_in C0 u_old u_new e_old e_new
    
Ts = sampling_time;
//L = 6;
//R = (0.016*temp-0.114)/(66.90-0.415*temp);
//K = 0.9/(R*L);
//Ti = 3*L;

    //the above is the ziegler nichols part
    
    
K = 2/(0.016*temp-0.114);
Ti = (66.90-0.415*temp);

//the above is the direct synthesis part

e_new = setpoint - temp;
S0=K*(1+((Ts/Ti)));
S1=-K;
u_new = u_old+(S0*e_new)+(S1*e_old);


u_old = u_new;
e_old = e_new;

heat = u_new;

    temp = comm(heat,fan);
    
    plotting([heat fan temp setpoint],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction