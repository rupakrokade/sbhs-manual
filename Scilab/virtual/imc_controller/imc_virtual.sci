mode(0)

global fan
function [temp,heat,e_new,stop] = imc_virtual(setpoint,fan,alpha)
global temp heat et SP u_new u_old u_new e_old e_new fdfh fdt fncr fncw m err_count stop

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

b=((1-alpha)/0.01163);
u_new = u_old + b*(e_new - (0.9723*e_old));

if u_new> 39
  u_new = 39;
end;

if u_new< 0
  u_new = 0;
end;

heat=u_new;
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
// disp(stop)
  end

return
endfunction


