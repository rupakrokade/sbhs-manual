mode(0)
funcprot(0)
filename = "2014-4-17-13-31-57.txt"
clf
exec('costf_2.sci');
exec('label.sci');
exec ('order_2_heater.sci');


data = fscanfMat(filename);
time = data(:, 1);
heater = int(data(:, 2));
fan = int(data(:, 3));
temp = data(:, 4);

//times=[time(1); time(1:$-1)];
time2 = time - time(1);
//time2 = time1/1000;


// find where the step change happens

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

//limits = [0,0,1000,10]; no=10000; // first step
// limits = [400,0,900,26]; no=5000;//second step
//lsterr = order_2(t,H,T,limits,no)
lsterr = order_2(t,H,T)
