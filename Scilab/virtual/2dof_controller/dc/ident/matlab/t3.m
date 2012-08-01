clear all
close all
clc
% to load the  input and output data

load prbs_4.mat
y2=simout(:,1);
u2=simout(:,2);
z=[y2 u2];
expt =iddata(y2,u2,4);% 4 -> sampling interval
expt.InputName = 'current';
expt.OutputName = 'height';

%Select the 200 first values for building a model:
ze = expt(200:400); 
%	Plot the interval from sample 300 to 400:
figure(1)
plot(ze) 
%plot(ze(100:200))


%% Remove the constant levels and make the data zero-mean:
ze = dtrend(ze);
figure(2)
plot(ze)
% Let us first estimate the impulse response of the system
% by correlation analysis to get some idea of time constants
% and the like:
figure(3)
impulse(ze,'sd',4); % it will give the dead time

% for predication error method
  m1 = pem(ze);
get(m1)

% comparision with validatoin data
zv = expt(500:600);
zv = dtrend(zv);
figure(4)
compare(zv,m1);
figure(5)
 step(m1,ze)

% fitting an armax model to it 2 poles 1 zeros 3 delays
m2 = armax(ze,[2 2 2 1])
%m2=armax(ze,[5,5,5,2])
figure(6)
compare(zv,m1,m2);

% check the residue
figure(7)
resid(ze,m1)
figure(8)
resid(ze,m2)
