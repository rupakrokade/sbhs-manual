m1 = idpoly([1,-0.5],[],[1,-0.8]);
% m1 = idpoly([1,-1.5,1.21,-0.455],[],[1,0.2,0.9]);
% m1 = idpoly([1,-0.5,0.5],[],[1,-1]);
e = 0.1*randn(100000,1);
y = sim(m1,e);
z = [y e]; idplot(z(1:500,:));  
ryy = xcorr(y,'coeff');
len = length(ryy);
zero = (len+1)/2;
ryy0 = ryy(zero);
ryy_one_side = ryy(zero+1:len);
for j = 1:5,
  for m = 1:5,
    A(j,m) = pacf_mat(ryy0,ryy_one_side,m,j);
  end
end
A

