mode(0)
global temp heat fan sampling_time m heatdisp fandisp tempdisp x name

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

function [temp] = step_test(heat,fan)
    global heatdisp fandisp tempdisp sampling_time m name
    


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

              xtitle("Step Test","Time(seconds)","Heat in percentage")

              plot2d(heatdisp,rect=[0,20,1000,50],style=1)

             

              fandisp=[fandisp;fan];

              subplot(312);

              xtitle("","Time(seconds)","Fan in percentage")

              plot2d(fandisp,rect=[0,0,1000,100],style=2)

             

              tempdisp=[tempdisp;temp];

              subplot(313)

              xtitle("","Time(seconds)","Temperature (deg celcius)")

              plot2d(tempdisp,rect=[0,25,1000,35],style=5)
              
              m=m+1;      
              
          else
              m = m+1;
        end

        
endfunction
