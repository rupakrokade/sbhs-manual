mode(0)

function temp = pid(setpoint,fan,K,Ti,Td,N)
    global heatdisp fandisp tempdisp setpointdisp sampling_time m name temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old r1 u_old_old
    
Ts = sampling_time;
e_new = setpoint - temp;

r1=-((Td/N)/((Td/N)+Ts));

S0=K*(1+(Ts/Ti)-(N*r1));
S1=K*((r1*(1+(Ts/Ti)+(2*N)))-1);
S2=-K*r1*(1+N);

u_new = r1*u_old_old-(r1-1)*u_old + S0*e_new + S1*e_old + S2*e_old_old;

u_old_old = u_old;
u_old = u_new;
e_old_old = e_old;
e_old = e_new;


heat = u_new;

    temp = comm(heat,fan);
    
    plotting([heat fan temp setpoint],[0 0 20 0],[100 100 40 1000])
    
    m=m+1;
endfunction

