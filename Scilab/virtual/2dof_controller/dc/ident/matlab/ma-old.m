m = idpoly(1,[],[1,1,-0.5,0.8,0.2]);
e = 0.1*randn(100000,1);
y = sim(m,e); z = [y e]; 
idplot(z(1:500,:)); figure
ryy = xcov(y,'coeff');
len = 2/sqrt(length(y));
r = 1:2*(len-1);
zero = (length(ryy)+1)/2;
stem(ryy(zero:zero+10))

