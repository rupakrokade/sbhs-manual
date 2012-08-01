//2DOF Controller
//Heater input is passed as input argument to introduce control effort 'CO'
//Fan input is passed as input argument which is kept at constant level(disturbance)
//Range of Fan input :60 to 252
//Temperature is read

function [temp,CO,et] = twodof(setpoint,disturbance)
global temp heat_in fan_in CO u_new u_old u_old_old  r_old y_old Rc1 Rc2 Rc3 Sc1 Sc2 Tc1 Tc2 gamm

e_new = setpoint - temp;
r_new = setpoint;
y_new = temp;

et=setpoint-temp;


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

heat_in = CO;
fan_in = disturbance;

ok = writebincom(handl,[254]); //heater
ok = writebincom(handl,[heat_in]);
ok = writebincom(handl,[253]);//fan
ok = writebincom(handl,[fan_in]);
ok = writebincom(handl,[255]);
sleep(1);
[temp,ok,nbytes] = readbincom(handl,2);
temp = temp(1) + 0.1*temp(2);


endfunction;

