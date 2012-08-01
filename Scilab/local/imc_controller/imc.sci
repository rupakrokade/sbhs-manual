mode(0)
function [temp,heat,e_new] = imc(setpoint,fan,alpha)
global temp heat_in fan_in et SP u_new u_old u_new e_old e_new

e_new = setpoint - temp;
b=((1-alpha)/0.01163);
u_new = u_old + b*(e_new - (0.9723*e_old));


  if u_new>100
    u_new = 100;
  end;
  
  if u_new<0
    u_new = 0
    ;
  end;
  
  
  if fan>100
    fan = 100;
  end;
  
  if fan<0
    fan = 0
    ;
  end;
   
 
heat = u_new; 
u_old = u_new;
e_old = e_new;


writeserial(handl,ascii(254)); //Input Heater, writeserial accepts strings; so convert 254 into its string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so convert it to its integer(ascii) equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points eg: 40.7

endfunction;

