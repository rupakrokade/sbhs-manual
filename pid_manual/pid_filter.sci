mode(0);
//PID Controller (with filtering)
//Heater input is passed as input argument to introduce control effort u_new.
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input : 60 to 252
//Temperature is read

function [temp,CO,et] = pid(setpoint,disturbance,K,Ti,Td,N)
global temp heat_in fan_in et SP CO eti u_old u_old_old u_new e_old e_new e_old_old

e_new = setpoint - temp;

Ts=0.5;

r1=-((Td/N)/((Td/N)+Ts));

S0=K*(1+(Ts/Ti)-(N*r1));
S1=K*((r1*(1+(Ts/Ti)+(2*N)))-1);
S2=-K*r1*(1+N);

u_new = r1*u_old_old-(r1-1)*u_old + S0*e_new + S1*e_old + S2*e_old_old;
et = setpoint - temp;
CO = u_new;

  if CO>39
    CO = 39;
  end;
  
  if CO<0
    CO = 0;
  end;
  
u_new = CO;     
  
u_old = u_new;
e_old_old = e_old;
e_old = e_new;


heat_in = CO;
fan_in = disturbance;

writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat_in));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan_in));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);
endfunction;

