omega = linspace(0.001,pi,1000);
ejw = exp(-j*omega);

G1 = 1-0.9*ejw; G2 = 1-0.8*ejw;
mag1 = abs(G1); angle1 = (angle(G1))*180/pi;
mag2 = abs(G2); angle2 = (angle(G2))*180/pi;

subplot(2,1,1)
loglog(omega,mag1,omega,mag2,'--')
axis tight, label('',18,' ','Magnitude',18)
subplot(2,1,2) 
semilogx(omega,angle1,omega,angle2,'--')
axis tight, label('',18,'w (rad/s)','Phase',18)
