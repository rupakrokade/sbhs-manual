mode(0);
//PI Controller using backward difference formula
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

function [temp,C0,e_new] = pi_bda(setpoint,disturbance,K,Ti)

global temp heat_in fan_in C0 u_old u_new e_old e_new

e_new = setpoint - temp;

Ts=1;
S0=K*(1+((Ts/Ti)));
S1=-K;
u_new = u_old+(S0*e_new)+(S1*e_old);


if u_new> 39
  u_new = 39;
end;

if u_new< 0
  u_new = 0;
end;

C0=u_new;
heat_in = C0;
fan_in = disturbance;
u_old = u_new;
e_old = e_new;


writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat_in));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan_in));
writeserial(handl,ascii(255));
sleep(10);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);

endfunction;


