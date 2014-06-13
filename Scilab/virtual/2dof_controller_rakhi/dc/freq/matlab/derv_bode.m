w = 0:0.01:pi;
G = 1-exp(-j*w);
subplot(2,1,1)
loglog(w,abs(G))
label('',18,' ','Magnitude',18)
subplot(2,1,2)
semilogx(w,180*angle(G)/pi);
label('',18,'w','Phase',18)



