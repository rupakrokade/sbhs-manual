mode(0);
 // Change filename here
filename = "2014-5-5-18-40-25.txt";
clf


exec('costfunction.sci');
exec('label.sci');
exec('second_order.sci');


data = fscanfMat(filename);

time = data(:, 1);

heater = int(data(:, 2));

fan = int(data(:, 3));

temp = data(:, 4);

ss_op_pt = heater(2);
for i=2:length(heater)
    if heater(i) ~= ss_op_pt then
        startTime = i;
        break
    end
end


time1 = time - time(1);
time2 = time1/1000;

baseheat = heater(5);
heater = heater(startTime:length(heater));
heater = heater - baseheat;

len = length(heater);

temp = temp(startTime:length(temp));
temp = temp - temp(1);

time = time2(startTime:length(time));
time = time - time(1);

t = time;
y = temp;
u = heater;

x0 = [0.2 0.2 0.5 0.5]; // Change initial guess here
delay = 5;      // Change delay here
global delay;
[f, xopt] = optim(costfunction, x0);

a1 = xopt(1)
a2 = xopt(2)
b1 = xopt(3)
b2 = xopt(4)

y_pred = second_order(u, xopt);

if size(y) ~= size(y_pred) then
    y_pred = y_pred';
end
err = norm(y - y_pred)/norm(y)

plot(t, y, "+");
plot(t, y_pred, "k");
//plot(t, u/10, "r");

label('Showing Second Order Model and Experimental Results',4,'Time (s)','Change in temperature (K)',4);
