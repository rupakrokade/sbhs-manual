mode(0)
//2DOF Controller
//Heater input is passed as input argument to introduce control effort 'CO'
//Fan input is passed as input argument which is kept at constant level(disturbance)
//Range of Fan input :60 to 252
//Temperature is read

function [temp,heat,e_new] = twodof(setpoint,fan)
global temp CO u_new u_old u_old_old  r_old y_old Rc1 Rc2 Rc3 Sc1 Sc2 Tc1 Tc2 gamm

e_new = setpoint - temp;
r_new = setpoint;
y_new = temp;



u_new = (1/Rc1)*(gamm*Tc1*r_new + gamm*Tc2*r_old-Sc1*y_new -Sc2*y_old-Rc2*u_old - Rc3*u_old_old);

CO = u_new;

  if CO>39
    CO = 39;
  end;
  
  if CO<0
    CO =0;
  end;
  
u_new = CO;     
  
u_old_old = u_old;
u_old = u_new;
r_old = r_new;
y_old = y_new;

heat = u_new;

writeserial(handl,ascii(254)); //Input Heater, writeserial accepts strings; so convert 254 into its string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so convert it to its integer(ascii) equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points eg: 40.7

endfunction;

