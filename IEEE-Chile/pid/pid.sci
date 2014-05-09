//PI tuning

x=0;
function [temp,CO,et,setpoint] = pid(disturbance)
global temp heat_in fan_in et SP CO eti et1 CObias x


if x<=600;
setpoint = 36;

elseif (x>600 & x<=1200);
setpoint = 40;

elseif x>1200;
setpoint = 31.25;
end



L1 = 10; tau1 = 90; k1 = 0.62; Ts = 0.4;

R1 = k1/tau1; a1 = R1*L1;

//Proportional controller
//kp = 1/a1; kc = kp;
//et = setpoint - temp;
//CO = CObias + kc*et

//PI controller
kpi = 0.9/a1; taui = 3*L1;
kc = kpi;
et = setpoint - temp;
eti = eti + et;
CO = CObias + kc*(et + (eti*Ts)/taui);

//PID controller
//kpid = 1.2/a1; taui = 2*L1; taud = 5*L1; 
//kpid = 1.2/a1; taui = 1.2*L1; taud = 0.25*L1; 
//kpid = 1.2/a1; taui = 3.5*L1; taud = 0.05*L1; 
//kpid = 1.2/a1; taui = 3.5*L1; taud = 0.001*L1; 

//et = setpoint - temp; etd = et - et1;
//eti = eti + et; kc = kpid;
//CO = CObias + kc*(et + ((eti*Ts)/taui) + ((etd*taud)/Ts));

  if CO>40
    CO = 40;
  elseif CO<0
    CO = 0;
  end;
 heat_in = CO; fan_in = disturbance;
    ok = writebincom(handl,[254]); //heater
    ok = writebincom(handl,[heat_in]);
    ok = writebincom(handl,[253]);
    ok = writebincom(handl,[fan_in]);
    ok = writebincom(handl,[255]);
    [temp3,ok,nbytes] = readbincom(handl,2); //upper byte
    sleep(1);
    ok = writebincom(handl,[255]);
    [temp4,ok,nbytes] = readbincom(handl,2);
    sleep(1);
    ok = writebincom(handl,[255]);
    [temp5,ok,nbytes] = readbincom(handl,2);
    temp6 = [temp3 temp4 temp5];
  for i=1:6
    if temp6(i) >10
      temp1 = temp6(i);
    else
      temp2 = temp6(i);
    end
  end
    temp7 = temp;
    temp = temp1 + 0.1*temp2;
//    if temp < 10
//      temp = temp7;
//    end;
    x=x+1;
    //disp(x)
endfunction;

