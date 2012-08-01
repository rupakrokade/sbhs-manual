close all
m = idpoly(1,[0 1.2 -0.1],1,[1 -0.94],[1 -1 0.2257],1); 
u = idinput(4000,'rbs'); 
e = 0.2*randn(4000,1); y = sim(m,[u e]);
z = [y u]; idplot(z(1:200,:)), figure
dataexp = iddata(y,u); dataexp.Tstart = 0;
datatrain = dataexp(1:2000);
datatest = dataexp(2001:4000);
cra(datatrain); figure
m1 = arx(z,[1,1,2]);
present(m1);

pause
% Estimating the OE Model

theta_oe1 = oe(datatrain,[1 1 1]);
present(theta_oe1);
resid(theta_oe1,datatrain);
figure
compare(theta_oe1,datatrain);
figure; compare(theta_oe1,datatest);

pause
% Estimating the Noise Model

err_oe1 = pe(theta_oe1,datatrain); 
plotacf(err_oe1.y,1e-03,20,1);
figure; arun_pacf(err_oe1.y,20);

theta_n1 = ar(err_oe1.y,2); 
present(theta_n1); 
err_n1 = pe(theta_n1,err_oe1); figure
plotacf(err_n1.y,1e-03,20,1);

pause
% Building the BJ Model from OE and Noise Models

B = theta_oe1.b; F = theta_oe1.f; D = theta_n1.a; 
gtotal = idpoly(1,B,1,D,F); 
theta_bj1 = bj(datatrain,gtotal); 
present(theta_bj1); 
resid(theta_bj1,datatrain); 
pause
figure

theta_bj2 = bj(datatrain,[1 0 1 2 1]); 
present(theta_bj2); 
resid(theta_bj2,datatrain); figure 
roots(theta_bj2.f); % Calculate Poles 
compare(theta_bj2,datatrain);
figure; compare(theta_bj2,datatest);

% Using difference data
diffu = diff(u); diffy = diff(y);
diffdata = iddata(diffy,diffu)
diffdatatrain = diffdata(1:2000);
diffdatatest = diffdata(2001:4000);
theta_oediff = oe(diffdatatrain,[1 1 1]); 
present(theta_oediff); 
resid(theta_oediff,diffdatatrain); 

theta_oediff = oe(diffdatatrain,[1 2 1]); 
present(theta_oediff); 
resid(theta_oediff,diffdatatrain); 

