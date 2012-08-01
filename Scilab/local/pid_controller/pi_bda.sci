mode(0);
//PI Controller using backward difference formula
//Heater input is passed as input argument to introduce control effort u(n)
//Fan input is passed as input argument which is kept at constant level
//Range of Fan input :20 to 252
//Temperature is read

global temp heat fan m x sampling_time heatdisp e_newdisp tempdisp n setpointdisp

//###################
sampling_time=0.5;//Enter Smpling time
Ts=sampling_time;
m=1;
n=1;
//##################
function [temp,heat_in,e_new] = pi_bda(setpoint,disturbance,K,Ti)

global temp heat_in fan_in C0 u_old u_new e_old e_new m x sampling_time heatdisp e_newdisp tempdisp n setpointdisp


e_new = setpoint - temp;

//Ts=0.5;
S0=K(1+(Ts/Ti));
S1=-K;



u_new = u_old+ S0*e_new+ S1*e_old;


u_old = u_new;
e_old = e_new;

heat_in = u_new;
fan_in = disturbance;

  if heat_in  >100
      heat_in = 100;
    elseif heat_in < 0
      heat_in = 0;
    end;
    
    if fan_in  >100
      fan_in = 100;
    elseif fan_in < 0
      fan_in = 0;
    end;

writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat_in));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan_in));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);
x=ceil(1/sampling_time);

 //disp('not plotting')

 //disp(modulo(m,x))

 //disp(x,'x=',m,'m=')

      if (modulo(m,x) == 1)

              //disp('plotting') 
              
              tempdisp=[tempdisp;temp];
              setpointdisp=[setpointdisp;setpoint];

              subplot(311)

              xtitle("PI BDA controller","Time(seconds)","Temperature (deg celcius)")

              plot2d([setpointdisp],rect=[0,20,1000,60],style=9)
              
              plot2d([tempdisp],rect=[0,20,1000,60],style=5)
              

                           

              heatdisp=[heatdisp;heat_in];

              subplot(312);

              xtitle("","Time(seconds)","Heat in percentage")
//disp('1st plot')
              plot2d(heatdisp,rect=[0,0,1000,100],style=1)

             

              e_newdisp=[e_newdisp;e_new];

              subplot(313);

              xtitle("","Time(seconds)","Fan in percentage")
//disp('2nd plot]')
              plot2d(e_newdisp,rect=[0,0,1000,100],style=2)

             

              
        n=n+1;

    end

    m=m+1;
endfunction;


