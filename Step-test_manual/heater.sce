mode(0)
filename = "step_data"
exec('costf_1.sci');
exec('label.sci');
data = fscanfMat(filename);
time = data(:, 1);
heater = int(data(:, 2));
fan = int(data(:, 3));
temp = data(:, 4);


len = length(heater);

len = length(heater);
heaters1 = [heater(1); heater(1:len-1)];
del_heat = heater - heaters1;
ind = find(del_heat>1);

step_instant = ind($)-1;

t = time(step_instant:len);
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
kp = xopt(1);
tau = xopt(2);
y_prediction = kp * ( 1 - exp(-t/tau) );
plot2d(t,y_prediction);
plot2d(t,y);
label('Showing First Order Model and Experimental Results',4,'Time (s)','Change in temperature (K)',4);
kp = kp/delta_u
tau