% Generating the input sequence

u = idinput(4000,'rbs',[0 0.1],[-1 1]);
simin = [(0:3999)' u(:)];
Ts = 1;

% Forming the data set

dataexp = iddata(simout(:),simin(:,2),1); 
dataexp.Tstart = 0; 
datatrain = dataexp(1:2000); 
datatest = dataexp(2001:4000); 
plot(datatrain), figure 
cra(datatrain), figure

step(datatrain); figure

% Estimating the ARX Model

theta_arx = arx(datatrain,[1 1 2]);
present(theta_arx);

% Estimating the best ARX Model

nn = struc((1:3),(1:3),2); 
v = arxstruc(datatrain,datatest,nn); 
best_struc = selstruc(v); 
theta_arx_best = arx(datatrain,best_struc);
present(theta_arx_best)
resid(theta_arx_best,datatrain);
