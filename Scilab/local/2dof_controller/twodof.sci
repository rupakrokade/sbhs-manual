mode(0);

function [temp,heat] = twodof(setpoint,fan)
global temp u_old_old u_old r_old_old r_old y_old_old y_old u_new heat r_new y_new

r_new = setpoint;
y_new = temp;
et = setpoint-temp;

//u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old + r_old_old*Tc(3)*gamm - Sc(1)*y_new -Sc(2)*y_old - Sc(3)*y_old_old - Rc(2)*u_old - Rc(3)*u_old_old);//second order control law

u_new = (1/Rc(1))*(gamm*Tc(1)*r_new + gamm*Tc(2)*r_old-Sc(1)*y_new -Sc(2)*y_old-Rc(2)*u_old - Rc(3)*u_old_old);//first order control law




u_old_old = u_old;
u_old = u_new;
r_old_old=r_old;
r_old = r_new;
y_old_old=y_old;
y_old = y_new;

heat=u_new;

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
    
  //heat = ceil(heat)
writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);
//disp(temp)
endfunction
