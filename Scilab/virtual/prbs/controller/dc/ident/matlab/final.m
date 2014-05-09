% program for using Two step procedure
clear 
close all
clc

% load the data ( data is in form u,y1 y2)
load finals_2005.mat;

n=input('enter the output sequence,1 for y1 or 2 for y2-->');

if n==1
    z = [y1 u]; 
else
    z=[y2 u];
end

figure(1);
idplot(z(100:1000,:)), % reponce of actual plant
z=dtrend(z);

figure(2)
idplot(z(100:1000,:));

dataexp = iddata(y1,u,1); 
dataexp.Tstart = 0;
datatrain = dataexp(100:1500); % data for test
datatest = dataexp(2501:3000); % data for velidation
figure(3)
cra(datatrain); % to see the impulse responce
figure(4)
step(datatrain)
 theta_oe1 = oe(datatrain,[1 2 1]); % prediction error model
% [1 2 1] is taken to make it quadratic, what step responce
% indiacates;
 present(theta_oe1);
 figure(5)
 resid(theta_oe1,datatrain); % check the residue
 figure(6)
 compare(theta_oe1,datatrain); % fitness between model and test data
 figure(7);
 compare(theta_oe1,datatest); % fitness between model and velidation data 
% Estimating the Noise Model
 
 err_oe1 = pe(theta_oe1,datatrain); % get the error between the model and actual data
 figure(8)
 plotacf(err_oe1.y,1e-03,20,1); % acto correlation function
 figure(9);
 arun_pacf(err_oe1.y,20); % partial suto correlation fumction
% 
  e1= randn(size(err_oe1.y));
  z_new =iddata(err_oe1.y,e1);
  
  theta_n1=ar(err_oe1.y,3);
  present(theta_n1);
  
%  theta_n1 = arx(z,[1 1 1]); % ARX modelling with 2 delay
%  present(theta_n1); 
 err_n1 = pe(theta_n1,err_oe1); % error estimaion
  figure(10)
  plotacf(err_n1.y,1e-03,20,1); % autocorelation plot
 disp('since plotacf is of white noise')
