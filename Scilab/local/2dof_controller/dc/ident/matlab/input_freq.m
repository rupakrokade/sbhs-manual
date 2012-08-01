m1 = idpoly([1 -0.9 0.08],[0 0.1 0.1],1); 
u = idinput(400,'rbs'); 
e = 0.1*randn(400,1); y=sim(m1,[u e]); 
z2=[y u]; idplot(z2), figure
m2=arx(z2,[1, 1, 2]); 
u = idinput(400,'rbs',[0 0.2]); 
e = 0.1*randn(400,1); y=sim(m1,[u e]); 
z3=[y u]; idplot(z3), figure
m3=arx(z3,[1, 1, 2]); 
u4 = idinput(400,'rbs',[0 0.05]); 
e = 0.1*randn(400,1); y=sim(m1,[u4 e]); 
z4=[y u4]; idplot(z4), figure
m4=arx(z4,[1, 1, 2]); 
nyquist(m1,'k',m2,'r--',m3,'g*',m4,'b-.',{0.0001,3.14});
