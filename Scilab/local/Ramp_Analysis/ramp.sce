mode(-1);

filename = "2014-4-17-17-13-35.txt";  //complete path of the saved data file
slope = 0.1; // change this to the slope that you have used in the experiment
ind1=3;
//Ramp Analysis
exec('cost_approx.sci');
exec('cost.sci');
exec('label.sci');

data = fscanfMat(filename);
time = data(:, 1);
heater = int(data(:, 2));
fan = int(data(:, 3));
temp = data(:, 4);


len = length(heater);
heaters1 = [heater(1); heater(1:$-1)];
del_heat = abs(heater - heaters1);
ind = find(del_heat>.5);

t = time(ind(2):ind($-1));
H = heater(ind(2):ind($-1));
T = temp(ind(2):ind($-1));

t = t - t(1);
T = T - T(1);

y = T;
x0 = [.5 100]
global('y','t');

[f, xopt] = optim(cost,x0);
kp = xopt(1)/slope
tau = xopt(2)

len = length(t);
halfway = ceil(len/2);

t_approx = t(halfway:len);
y_approx = y(halfway:len);
global('y_approx','t_approx');

[f_approx,xopt_approx] = optim(cost_approx,x0);
kp_approx = xopt_approx(1)/slope;
tau_approx = xopt_approx(2);
lsterr = sqrt(f);
lsterr_approx=sqrt(f_approx);

//Display and Plot
//disp('kp = ');
//disp(kp);
//disp('tau = ');
//disp(tau);
//disp('kp_approx = ');
//disp(kp_approx);
//disp('tau_approx = ');
//disp(tau_approx);

y_p = kp*slope*(t + tau*(exp(-t/tau) - 1));
y_p_approx = kp_approx*slope*(t_approx - tau_approx);
y_p_approx = y_p_approx';
plot2d(t,[y_p,T]);

title=('First order model with tau = '+string(tau)+', Kp = '+string(kp)+', tauApprox = '+string(tau_approx)+', KpApprox = '+string(kp_approx)+', Error = '+string(lsterr));
label(title,4,'time (s)','Change in temperature (K)',4);

//label('Showing First Order Model and Experimental Results for kp and tau',4,'Time (s)','Change in Temperature (Predicted,Actual)',4);
legend(['Predicted';'Actual']);

