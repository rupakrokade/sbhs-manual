mode(0);
function [stop] = ramptest(heat,fan)
global fdfh fdt fncr fncw m err_count stop heatdisp fandisp tempdisp limits m x sampling_time 

fncr = 'scilabread.sce';          //file to be read - temperature
fncw = 'scilabwrite.sce';        //file to be written - heater, fan

a = mgetl(fdt,1);
b = evstr(a);
byte = mtell(fdt);
mseek(byte,fdt,'set');

if a~= []
    temps = b(1,4); heats = b(1,2);
    fans = b(1,3); y = temps;

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

  
  x=ceil(1/sampling_time);
      if (modulo(m,x) == 1|sampling_time >= 1)
              
              heatdisp=[heatdisp;heat];
              subplot(311);
              xtitle("Ramp Test","Time(seconds)","Heat in percentage")
              plot2d(heatdisp,rect=[0,0,1000,100],style=1)
             
              fandisp=[fandisp;fan];
              subplot(312);
              xtitle("","Time(seconds)","Fan in percentage")
              plot2d(fandisp,rect=[0,0,1000,100],style=2)
             
              tempdisp=[tempdisp;y];
              subplot(313)
              xtitle("","Time(seconds)","Temperature (deg celcius)")
              plot2d(tempdisp,rect=[0,20,1000,70],style=5)
              
       
        end
        m = m+1;
  else 
      m = m+1;
    y = 0; 
    err_count = err_count + 1; //counts the no of times network error occurs
    if err_count > 300
      disp("NO NETWORK COMMUNICATION!");
     stop = 1;  // status set for stopping simulation
     end
  end

return
endfunction
