mode(0)
function [temp] = twodof(setpoint,fan)
global temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old

global heatdisp fandisp tempdisp setpointdisp sampling_time m name

global temp u_old_old u_old r_old_old r_old y_old_old y_old u_new heat r_new y_new

Ts=sampling_time;

r_new = setpoint;
y_new = temp;
et = setpoint-temp;

//u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old + r_old_old*Tc(3)*gamm - Sc(1)*y_new -Sc(2)*y_old - Sc(3)*y_old_old - Rc(2)*u_old - Rc(3)*u_old_old);//second order control law

u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old-Sc(1)*y_new -Sc(2)*y_old-Rc(2)*u_old - Rc(3)*u_old_old);//first order control law

u_old_old = u_old;
u_old = u_new;
r_old_old=r_old;
r_old = r_new;
y_old_old=y_old;
y_old = y_new;


heat = u_new;
    temp = comm(heat,fan);
    
    plotting([heat fan temp setpoint],[0 0 20 0],[100 100 80 1000])
    
    m=m+1;
endfunction

