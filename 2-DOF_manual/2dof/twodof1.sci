//2DOF Controller
//Heater input is passed as input argument to introduce control effort 'CO'
//Fan input is passed as input argument which is kept at constant level(disturbance)
//Range of Fan input :60 to 252
//Temperature is read

function [temp,heat_in,et] = twodof(setpoint,disturbance)
global fdfh fdt fncr fncw m err_count stop
global temp heat_in et fan_in CO u_new u_old u_old_old  r_old y_old Rc1 Rc2 Rc3 Sc1 Sc2 Tc1 Tc2 gamm

//Rc1 = 0.0040843;
//Rc2 = -.6503631554*0.0040843;
//Rc3 = -0.0458005451*0.0040843;
//Sc1 = -767.86991
//Sc2 = 767.86991 * 0.3678794479; 
//Tc1 = 1;
//Tc2 = -0.3678794479;
//gamm = 0.1200552;

fncr = 'clientread.sce';         
fncw = 'clientwrite.sce';        

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
temps = b(1,$); heats = b(1,$-2);
    fans = b(1,$-1); y = temps;
     temp = y;
e_new = setpoint - temp;
r_new = setpoint;
y_new = temp;

et=setpoint-temp;


//u_new = (1/Rc1)*(gamm*Tc1*r_new + gamm*Tc2*r_old-Sc1*y_new -Sc2*y_old-Rc2*u_old - Rc3*u_old_old);

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

//ok = writebincom(handl,[254]); //heater
//ok = writebincom(handl,[heat_in]);
//ok = writebincom(handl,[253]);//fan
//ok = writebincom(handl,[fan_in]);
//ok = writebincom(handl,[255]);
//sleep(1);
//[temp,ok,nbytes] = readbincom(handl,2);
//temp = temp(1) + 0.1*temp(2);

A = [m,m,heat_in,fan_in];
  fdfh = file('open','clientwrite.sce','unknown');
  file('last', fdfh)
  write(fdfh,A,'(7(e11.5,1x))');
  file('close', fdfh);
  m = m+1;
  else 
    y = 0; 
    err_count = err_count + 1; //counts the no of times network error occurs
    if err_count > 300
      disp("NO NETWORK COMMUNICATION!");
     stop = 1;  // status set for stopping simulation
     end
  end

return
endfunction;

