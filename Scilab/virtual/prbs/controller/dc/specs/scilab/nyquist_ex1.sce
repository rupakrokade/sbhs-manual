// Updated(24-7-07)
// 7.2

H = trfu(1,[1 -1 0],-1);
w = -5:0.4:5;
fre = w/(2*%pi);
nyquist(H,fre);
xset('window',1)
nyquist(H)
xset('window',2)
w = -1.3:0.3:3.3;
fre = w/(2*%pi);
fre = -0.557:0.02:0.557;
fre = 0.01:0.01:1;
nyquist(H,fre);
 
