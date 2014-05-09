% Generating the input sequence
u = idinput(2000,'rbs',[0 0.1],[-1 1]);
simin = [(0:1999)' u(:)];
open_system('drift_ex1.mdl')
R = input('Now execute drift_ex1.mdl and hit the return key ');

% Execute simulink code and generate output data
dataexp = iddata(simout(:),simin(:,2),1); 
dataexp.Tstart = 0; 
datatrain = dataexp(1:1000); 
datatest = dataexp(1001:2000); 

% Plots
plot(datatrain), cra(datatrain); grid
figure(2), step(datatrain); grid

% Estimating the OE Model
theta_oe1 = oe(datatrain,[1 1 1]);
present(theta_oe1);
figure(3), resid(theta_oe1,datatrain);
figure(4), compare(theta_oe1,datatrain);
figure(5); compare(theta_oe1,datatest);

% Estimating the Noise Model
err_oe1 = pe(theta_oe1,datatrain); 
figure(6), plotacf(err_oe1.y,1e-03,10,1);
figure(7), pacf(err_oe1.y,10);

theta_n1 = ar(err_oe1.y,1); 
present(theta_n1); 
err_n1 = pe(theta_n1,err_oe1); 
figure(8), plotacf(err_n1.y,1e-03,10,1);

% Building the BJ Model from OE and Noise Models
B = theta_oe1.b; F = theta_oe1.f; D = theta_n1.a; 
gtotal = idpoly(1,B,1,D,F); 
theta_bj1 = bj(datatrain,gtotal); 
present(theta_bj1); 
figure(9), resid(theta_bj1,datatrain); 

dB = length(B)-1; dD = length(D)-1; dF = length(F)-1+1;
theta_bj2 = bj(datatrain,[dB 0 dD dF 1]);
present(theta_bj2); 
figure(10), resid(theta_bj2,datatrain); 
roots(theta_bj2.f); % Calculate Poles 
figure(11), compare(theta_bj2,datatrain);
figure(12), compare(theta_bj2,datatest);

% Estimating the OE model on differenced data
datadifftrain = iddata(diff(datatrain.y),diff(datatrain.u),1);
theta_oediff = oe(datadifftrain,[1 1 1]); 
present(theta_oediff); 
figure(13), resid(theta_oediff,datadifftrain); 
 
theta_oediff = oe(datadifftrain,[1 2 1]); 
present(theta_oediff); 
figure(14), resid(theta_oediff,datadifftrain); 

theta_oediff = oe(datadifftrain,[2 2 1]); 
present(theta_oediff); 
figure(15), resid(theta_oediff,datadifftrain); 

% Presenting the two models
m_oe = idpoly(1,theta_oediff.B,1,[1 -1],theta_oediff.F);
present(m_oe);
present(theta_bj2);
