function [y,stop] = mpc(Tsp,fan) 
global fdfh fdt fncr fncw m err_count stop p q xk_old heat

fncr = 'scilabread.sce';         
fncw = 'scilabwrite.sce';       

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
    temps = b(1,4); heats = b(1,2);
    fans = b(1,3); y = temps;
    
    [heat] = mpc_run(y,heats,Tsp);

    if heat>100
      heat = 100;
    elseif heat<0
      heat = 0;
    end;
    
    if fan>100
      fan = 100;
    elseif fan<0
      fan = 0;
    end;
  
  A = [m,heat,fan,m];
  fdfh = file('open','scilabwrite.sce','unknown');
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
