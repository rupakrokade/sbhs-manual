m = idpoly(1,[0 0 0.3 0.2],1,[1 -0.1],[1 -0.9 0.2],1); 
u = idinput(4000,'rbs'); 
e = 0.2*randn(4000,1); y = sim(m,[u e]);
z = [y u]; idplot(z(1:200,:)), figure
dataexp = iddata(y,u); dataexp.Tstart = 0;
datatrain = dataexp(1:2000);
datatest = dataexp(2001:4000);
cra(datatrain); 
pause
figure, m1 = arx(z,[1,1,2]);
present(m1);
% Estimating the best ARX Model

nn = struc((1:3),(1:3),2); 
v = arxstruc(datatrain,datatest,nn); 
best_struc = selstruc(v); 
m1_best = arx(datatrain,best_struc);
present(m1_best)
resid(m1_best,datatrain)
