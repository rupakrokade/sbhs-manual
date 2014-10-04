m=1;
function [temp] = comm(heat,fan)
    global heatdisp fandisp tempdisp sampling_time m name handl filename

if heat<0
    heat=0
end
if heat>100
    heat=100
end
if fan<0
    fan=0
end
if fan>100
    fan=100
end

writeserial(handl,ascii(254)); //Input Heater, writeserial accepts                                       strings; so convert 254 into its                                        string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so                                       convert it to its integer(ascii)                                      equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points                                     eg: 40.7
epoch=getdate('s');
dt=getdate();
ms=dt(10);
epoch=(epoch*1000)+ms;

A = [m,heat,fan,temp,epoch];

fdfh = file('open',filename,'unknown');

file('last', fdfh)

write(fdfh,A,'(7(f15.1,3x))');

file('close', fdfh);

endfunction
