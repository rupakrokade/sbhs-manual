function [y,stop] = mpc(Tsp,fan) 
global fdfh fdt fncr fncw m err_count stop p q xk_old

fncr = 'clientread.sce';         
fncw = 'clientwrite.sce';       

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
    temps = b(1,$); heats = b(1,$-2);
    fans = b(1,$-1); y = temps;
    
    heat = mpc_run(y,heats,Tsp);

    if heat>40
      heat = 40;
    elseif heat<0
      heat = 0;
    end;
  
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
