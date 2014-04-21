mode(0)
global temp heat fan sampling_time m heats
//heatdisp fandisp tempdisp setpointdisp x name

clear heatdisp fandisp tempdisp setpointdisp


//**Sampling Time**//
sampling_time = 1;
///////****/////////

//m = 1;

dt = getdate();
year = dt(1);
month = dt(2);
day = dt(6);
hour = dt(7);
minutes = dt(8);
seconds = dt(9);

file1 = strcat(string([year month day hour minutes seconds]),'-');
string txt;
filename = strcat([file1, "txt"],'.');


function [temp] = mpc(Tsp,fan)
global temp heat_in fan_in C0 u_old u_new e_old e_new e_old_old

global heatdisp fandisp tempdisp setpointdisp sampling_time m name

u_new = mpc_run(temp,heats,Tsp);


heat = u_new;

heats=heat;
setpoint = Tsp;
    
    if heat  >100
      heat = 100;
    elseif heat < 0
      heat = 0;
    end; 


writeserial(handl,ascii(254)); //Input Heater, writeserial accepts                                       strings; so convert 254 into its                                        string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so                                       convert it to its integer(ascii)                                      equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points                                     eg: 40.7

A = [m,heat,fan,temp];

fdfh = file('open',filename,'unknown');

file('last', fdfh)

write(fdfh,A,'(7(e11.5,1x))');

file('close', fdfh);


x=ceil(1/sampling_time);

      if (modulo(m,x) == 1|sampling_time >= 1)


              heatdisp=[heatdisp;heat];

              subplot(311);

              xtitle("PID Controller","Time(seconds)","Heat in percentage")

              plot2d(heatdisp,rect=[0,0,1000,100],style=1)

             

              fandisp=[fandisp;fan];

              subplot(312);

              xtitle("","Time(seconds)","Fan in percentage")

              plot2d(fandisp,rect=[0,0,1000,100],style=2)

             

              tempdisp=[tempdisp;temp];
	      setpointdisp=[setpointdisp;setpoint];

              subplot(313)

              xtitle("","Time(seconds)","Temperature (deg celcius)")

              plot2d(tempdisp,rect=[0,30,1000,40],style=5)
	      plot2d(setpointdisp,rect=[0,30,1000,40],style=1)
              
              m=m+1;      
              
          else
              m = m+1;
        end

        
endfunction
