m = idpoly([1 -0.5],[0 1 -0.9],[1 -0.7],1,1,1);
u = idinput(4000,'rbs'); 
e = 0.05*randn(4000,1); y1 = sim(m,[u e]);
z = [y1 u]; idplot(z(1:200,:))
e = 0.3*randn(4000,1); y2 = sim(m,[u e]);
z = [y2 u]; figure, idplot(z(1:200,:))
