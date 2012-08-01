t=0:0.1:100;
a=sin(t);
b=cos(t);
clf
subplot(311)
plot(t,[a;b],rect=[0,20,100,60],style=4)