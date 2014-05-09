mode(0);
//PI Controller using backward difference formula
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

function [temp,heat_in,e_new] = pi(setpoint,disturbance,K,Ti)

global temp heat_in fan_in C0 u_old u_new e_old e_new

e_new = setpoint - temp;

Ts=0.5;
S0=K(1+(Ts/Ti));
S1=-K;
u_new = u_old+ S0*e_new+ S1*e_old;

u_old = u_new;
e_old = e_new;

heat_in = u_new;
fan_in = disturbance;

  if heat_in  >40
      heat_in = 40;
    elseif heat_in < 0
      heat_in = 0;
    end;

writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat_in));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan_in));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);

endfunction;


