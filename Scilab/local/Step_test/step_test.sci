mode(0)
global temp heat fan

function temp = step_test(heat,fan)
    global heatdisp fandisp tempdisp sampling_time
    
sampling_time=1;

skip = 1/sampling_time;
writeserial(handl,ascii(254)); //Input Heater, writeserial accepts                                       strings; so convert 254 into its                                        string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so                                       convert it to its integer(ascii)                                      equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points                                     eg: 40.7
if skip~=0
    
    heatdisp=[heatdisp;heat];
  subplot(311);
  xtitle("","Time(seconds)","Heat in percentage")
 plot2d(heatdisp,rect=[0,0,2000,100])
 
  fandisp=[fandisp;fan];
  subplot(312);
  xtitle("","Time(seconds)","Fan in percentage")
 plot2d(fandisp,rect=[0,0,2000,100])
 
 tempdisp=[tempdisp;temp];
 subplot(313)
  xtitle("","Time(seconds)","Temperature in degree celcius")
 plot2d(tempdisp,rect=[0,0,2000,100])
skip=skip-1;
end

endfunction