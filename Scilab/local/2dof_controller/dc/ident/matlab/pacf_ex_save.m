m = idpoly([1,-1,0.5],[],1);
% m = idpoly([1,-0.5],[],1);
e = 0.1*randn(100000,1);
y = sim(m,e); 
z = [y e]; idplot(z(1:500,:)); figure
ryy = xcorr(y,'coeff');
len = length(ryy);
zero = (len+1)/2;
ryy0 = ryy(zero);
ryy_one_side = ryy(zero+1:len);
ajj = [];
for p = 1:10,
  ajj = [ajj pacf_mat(ryy0,ryy_one_side,p,1)];
end
stem(ajj)
