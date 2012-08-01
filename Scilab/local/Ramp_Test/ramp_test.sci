mode(-1);
global temp heat fan m x sampling_time heatdisp fandisp tempdisp

sampling_time=0.5;//Enter Smpling time
m=1;

function temp = ramp_test(heat,fan)
global m x sampling_time heatdisp fandisp tempdisp


writeserial(handl,ascii(254)); //Input Heater, writeserial accepts strings; so convert 254 into its                                        string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so                                       convert it to its integer(ascii)equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points                                     eg: 40.7
x=ceil(1/sampling_time);
 //disp('not plotting')
 //disp(modulo(m,x))
 //disp(x,'x=',m,'m=')
      if (modulo(m,x) == 1)
              //disp('plotting')              
              heatdisp=[heatdisp;heat];
              subplot(311);
              xtitle("Step Test","Time(seconds)","Heat in percentage")
              plot2d(heatdisp,rect=[0,0,1000,100],style=1)
             
              fandisp=[fandisp;fan];
              subplot(312);
              xtitle("","Time(seconds)","Fan in percentage")
              plot2d(fandisp,rect=[0,0,1000,100],style=2)
             
              tempdisp=[tempdisp;temp];
              subplot(313)
              xtitle("","Time(seconds)","Temperature (deg celcius)")
              plot2d(tempdisp,rect=[0,20,1000,60],style=5)
              
 end
    m=m+1;
endfunction