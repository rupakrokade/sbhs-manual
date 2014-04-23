mode(0);

function [stop,temp] = comm(heat,fan)

global fdfh fdt fncr fncw m err_count stop m

fncr = 'scilabread.sce';          //file to be read - temperature
fncw = 'scilabwrite.sce';        //file to be written - heater, fan

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');


if a~= []
    temp = b(1,4);

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
      m=m+1;
      
  else 
      m = m+1;
    temp = 0; //This variable will make temp plot go to zero whenever there is a packet loss
    err_count = err_count + 1; //counts the no of times network error occurs
    if err_count > 200
      disp("NO NETWORK COMMUNICATION!");
     stop = 1;  // status set for stopping simulation
     end
  end
return
endfunction
