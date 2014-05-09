clear data7; exec('ramp30.txt'); getf('label.sci');
global N
getf('approx_ramp.sci');
T = data7(:,1); //T is time
u = data7(:,2); y = (data7(:,4) - data7(1,4)); // u is current, y is temperature
N = 70; input_slope = 0.5;
e = [T y];
f = e(length(u)-N:length(u),:);
g = f(:,1);
h = (g-g)+1;
i = [g h];
j = f(:,2);
l = inv(i'*i)*i'*j
gain = l(1,1)/(input_slope)
z = -(l(2,1)/(gain*input_slope))
tau = z;  limits = [0,0,90,45]; no=4000;
lsterr = approx_ramp(T,u,y,input_slope,tau,limits,no);
