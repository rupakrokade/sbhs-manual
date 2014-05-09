w = 0:0.01:pi;
subplot(2,1,1)
loglog(w,abs(1+2*cos(w))/3)
label('',18,' ','Magnitude',18)
subplot(2,1,2)
semilogx(w,angle(1+2*cos(w))*180/pi)
label('',18,'w','Phase',18)



