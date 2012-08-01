 
global temp heat heats et SP u_new u_old u_new e_old e_new err_count stop p q xk_old 

function [temp] = mpc(Tsp,fan)

u_new = mpc_run(temp,heats,Tsp);


  if u_new>40
    u_new = 40;
  end;
  
  if u_new<0
    u_new = 0
    ;
  end;

heat=u_new;
 
heats=heat;


writeserial(handl,ascii(254)); //Input Heater, writeserial accepts strings; so convert 254 into its string equivalent 
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253)); //Input Fan
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255)); //To read Temp
sleep(100);

temp = ascii(readserial(handl)); // Read serial returns a string, so convert it to its integer(ascii) equivalent
temp = temp(1) + 0.1*temp(2); // convert to temp with decimal points eg: 40.7

endfunction;

