mode(0);
//PID using Backward difference approximation for I and D

function [temp,heat,et,stop] = pid_bda_tuned(setpoint,disturbance)
global temp heat fan et SP CO eti u_old u_new e_old e_new e_old_old fdfh fdt fncr fncw m err_count stop
L = 6;
R = (0.016*temp-0.114)/(66.90-0.415*temp);
K = 1.2/(R*L)
Ti = 2*L;
//Kc and tau_i calculated
Td = 0.5*L;


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

S0=K*(1+(Ts/Ti)+(Td/Ts));
S1=K*(-1-((2*Td)/Ts));
S2=K*(Td/Ts);

u_new = u_old + S0*e_new + S1*e_old + S2*e_old_old;


if u_new> 39
  u_new = 39;
end;

if u_new< 0
  u_new = 0;
end;

heat=u_new;
fan = disturbance;

u_old = u_new;
e_old_old = e_old;
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


