mode(0);
filename= '29Apr2014_14_03_40.txt';//Enter the data file name in single quotes
f=0.01;// Enter the frequency 
data6=fscanfMat(filename);
data7=data6(2:$,:);
exec('labelbode.sci');
T = data7(:,5); fan = data7(:,3);//T is time, fan is fan speed
u = data7(:,2)-data7(1,2); y = data7(:,4)-data7(1,4); // u is current, y is temperature


period=ceil(1/f);
p=length(u);
sampling = T(3)-T(2);//sampling time
sampling = sampling/1000;
index = round((period)/sampling);//calculating the duration of last cycle of waveform
times=T($-index:$);
temp = y($-index:$);// output for last cycle
heater = u($-index:$);//input for last cycle
[max_heater,pointer1] = max(heater);//determining max amplitude and index for last cycle of input (index is relative to last cycle)
[max_temp,pointer2] = max(temp);//determining max amplitude and index for last cycle of input (index is relative to last cycle)
pointer1 = pointer1 + (p-index);//conversion of index for input in terms of complete data period
pointer2 = pointer2 + (p-index);//conversion of index for output in terms of complete data period
Amplitude_ratio_dB = 20*log10(y(pointer2)/u(pointer1))//To find gain in dB
Phase_difference = 360*f*(pointer1-pointer2)*sampling// phase difference in degrees
//Phase_difference = -((pointer1-pointer2)/(1/f))*360


del_T = T-T(1);
del_T = del_T/1000;
plot2d(del_T,[u y]);
label('Plot of sine input in heater and the corresponding temperature profile',4,'Time (s)','Change in temperature and heater',4);
//legend(['Heater';'Temperature']);

