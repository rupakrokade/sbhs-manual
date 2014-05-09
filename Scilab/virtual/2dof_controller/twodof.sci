mode(0)

global fan
function [temp,heat,stop] = twodof(setpoint,fan)
global temp u_old_old u_old r_old_old r_old y_old_old y_old u_new heat r_new y_new fdfh fdt fncr fncw m err_count stop

fncr = 'clientread.sce';          //file to be read - temperature
fncw = 'clientwrite.sce';        //file to be written - heater, fan

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
    temp = b(1,$); heats = b(1,$-2);
    fans = b(1,$-1); y = temp;

r_new = setpoint;
y_new = temp;
et = setpoint-temp;

u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old + r_old_old*Tc(3)*gamm - Sc(1)*y_new -Sc(2)*y_old - Sc(3)*y_old_old - Rc(2)*u_old - Rc(3)*u_old_old);//second order control law

//u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old-Sc(1)*y_new -Sc(2)*y_old-Rc(2)*u_old - Rc(3)*u_old_old);//first order control law

if u_new> 39
  u_new = 39;
end;

if u_new< 0
  u_new = 0;
end;

u_old_old = u_old;
u_old = u_new;
r_old_old=r_old;
r_old = r_new;
y_old_old=y_old;
y_old = y_new;

heat=u_new;



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
// disp(stop)
  end

return
endfunction


