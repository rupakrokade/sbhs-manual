clear data7; exec('data02.dat'); getf('label.sci');
T = data7(:,1); fan = data7(:,3); //T is time, fan is fan speed
u = data7(:,2); y = data7(:,4)-data7(1,4); // u is current, y is temperature
ord = [u y]; x = [T T]; // u and y are plotted vs. time and time
xbasc(); plot2d(x,ord); xgrid();
title = 'Ramp change in current and the resulting temperature'
label(title,4,'time (s)','Current, Temperature (C)',4);
