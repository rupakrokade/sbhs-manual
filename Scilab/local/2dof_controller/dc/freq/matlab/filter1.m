omega = linspace(0,pi);
g1 = 0.5 ./ (cos(omega)-0.5+j*sin(omega));
mag1 = abs(g1);
angle1 = angle(g1) * 180/pi;
g2 = (0.5+0.5*cos(omega)-1.5*j*sin(omega)) ...
   * 0.25 ./ (1.25-cos(omega));
mag2 = abs(g2);
angle2 = angle(g2) * 180/pi;
subplot(2,1,1)
plot(omega,mag1,omega,mag2,'--')
axis tight, label('',18,' ','Magnitude',18)
subplot(2,1,2) 
plot(omega,angle1,omega,angle2,'--')
axis tight, label('',18,'w (rad/s)','Phase',18)






