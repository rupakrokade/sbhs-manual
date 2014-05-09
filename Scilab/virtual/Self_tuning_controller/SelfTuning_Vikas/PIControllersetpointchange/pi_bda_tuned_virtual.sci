mode(0);
//PI Controller using backward difference formula
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

function [temp,heat,e_new,stop] = pi_bda_tuned(setpoint,disturbance)
global temp heat fan C0 u_old u_new e_old e_new fdfh fdt fncr fncw m err_count stop

//L = 6;
//R = (0.016*temp-0.114)/(66.90-0.415*temp);
//K = 0.9/(R*L);
//Ti = 3*L;


//The above is the Ziegler nichols part.

K = 2/(0.016*temp-0.114);
Ti = (66.90-0.415*temp);
//The above is the direct synthesis part


fncr = 'clientread.sce';          //file to be read - temperature
fncw = 'clientwrite.sce';        //file to be written - heater, fan

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
    temp = b(1,$); heats = b(1,$-2);
    fans = b(1,$-1); y = temp;

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

heat=u_new;
fan = disturbance;

u_old = u_new;
e_old = e_new;

A = [m,m,heat,fan];
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
endfunction


