mode(0)
funcprot(0)
clear data7; exec('labelbode.sci');
filename= 'sine001';//Enter the data file name in single quotes
f=0.001;// Enter the frequency 
data7=fscanfMat(filename);
T = data7(:,1); fan = data7(:,3); //T is time, fan is fan speed
u = data7(:,2)-data7(1,2); y = data7(:,4)-data7(1,4); // u is current, y is temperature

p=length(u);// u is current
data_width=3;
p2=(p/data_width);
p1=round(p2);
[q,k]=max(u((p-p1):p,1));//q is maximum input amplitude
x1=(p-p1)+k;//Input(Current)reference point(time)
ST=T(2,1)-T(1,1);//Sampling Time
x2=(x1+((1/ST)*(1/f)));
x2=round(x2);
[e,k1]=max(y(x1:x2,1));//e is maximum output amplitude between x1 and x2
L=x1+k1;
t1=T(x1,1);
t2=T(L,1);
delt=(t2-t1);
Amplituderatio = (e/q);
Amplitude_ratio_in_dB=20*log10(e/q)
Phase_difference = -((delt)/(1/f))*360
//ord = [u y]; x = [T T]; // u and y are plotted vs. time and time
//xbasc(); plot2d(x,ord); xgrid();
//title = 'Sine change in current and the resulting temperature'
//label(title,4,'time (s)','Current, Temperature (C)',4);
