mode(0);
function [temp,heat,et] = pid_bda(setpoint,fan,K,Ti,Td)
global temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old


e_new = setpoint - temp;

Ts=0.5;

S0=K*(1+(Ts/Ti)+(Td/Ts));
S1=K*(-1-((2*Td)/Ts));
S2=K*(Td/Ts);

u_new = u_old + S0*e_new + S1*e_old + S2*e_old_old;

u_old = u_new;
e_old_old = e_old;
e_old = e_new;


heat = u_new;
    
    if heat  >40
      heat = 40;
    elseif heat < 0
      heat = 0;
    end;
  
writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);
endfunction;
