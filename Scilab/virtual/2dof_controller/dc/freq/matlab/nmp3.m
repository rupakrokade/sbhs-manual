omega = linspace(-pi,pi);
ejw = exp(-j*omega);

G1 = 1+0.5*ejw; 
mag1 = abs(G1);
angle1 = (angle(G1))*180/pi;
G2 = 0.5+ejw;
mag2 = abs(G2);
angle2 = (angle(G2))*180/pi;

subplot(2,1,1)
plot(omega,mag1,omega,mag2,'--')
axis tight, label('',18,' ','Magnitude',18)
subplot(2,1,2) 
plot(omega,angle1,omega,angle2,'--')
axis tight, label('',18,'w (rad/s)','Phase',18)






