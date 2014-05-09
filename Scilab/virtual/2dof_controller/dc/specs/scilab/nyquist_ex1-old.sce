H = trfu(1,[1 -1 0],-1);
nyquist(H)

xset('window',1)
w = -3.5:0.2:3.5;
fre = w/(2*%pi); // Frequency range specified
nyquist(H,fre);

xset('window',2)
w = -5:0.4:5;
fre = w/(2*%pi); // Frequency range specified
nyquist(H,fre);
