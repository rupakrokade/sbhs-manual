mode(0)
filename = "step-data-local.txt"

clf
exec('costf_1.sci');
exec('label.sci');
data = fscanfMat(filename);
time = data(:, 5);
heater = int(data(:, 2));
fan = int(data(:, 3));
temp = data(:, 4);


len = length(heater);

time1 = time - time(1);
time2 = time1/1000;

len = length(heater);
heaters1 = [heater(1); heater(1:len-1)];
del_heat = heater - heaters1;
ind = find(del_heat>1);

step_instant = ind($)-1;

t = time2(step_instant:len);
t = t - t(1);
H = heater(step_instant:len);
F = fan(step_instant:len);
T = temp(step_instant:len);
T = T - T(1);
delta_u = heater(step_instant + 1)- heater(step_instant);

//finding Kp and Tau between Heater (H) and Temperature (T)
y = T;   //temperature
global('y','t');
x0 = [.3 40];
//[f,xopt,gopt] = optim(costf_1,'b',[0.1 0.1],[5 100],x0,'ar')
[f, xopt] = optim(costf_1,x0);
lsterr=sqrt(f);
kp = xopt(1);
tau = xopt(2);
y_prediction = kp * ( 1 - exp(-t/tau) );
plot2d(t,y_prediction);
plot2d(t,y);
title = 'First Order model with tau = ';
title = title+string(tau);
title = title+', Kp='+string(kp/delta_u);
title = title+', Error='+string(lsterr)+'';
label(title,4,'time (s)','Change in temperature (K)',4);
kp = kp/delta_u
tau
