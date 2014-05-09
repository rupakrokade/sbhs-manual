mode(0);
//PI Controller using backward difference formula
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read
function [temp,CO,et,eti] = pi(setpoint,disturbance)

global temp heat_in fan_in et SP CO eti et1


L1 = 10; tau1 = 90; k1 = 0.62; Ts = 0.4;

R1 = k1/tau1; a1 = R1*L1;

//Proportional controller
//kp = 1/a1; kc = kp;
//et = setpoint - temp;
//CO = CObias + kc*et

//PI controller
kpi = 0.9/a1; taui = 3*L1;
kc = kpi;
et = setpoint - temp;
eti = eti + et;
CO = CObias + kc*(et + (eti*Ts)/taui);

heat_in = CO;
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


