omega = linspace(-pi,pi);
ejw = exp(-j*omega);

G3 = G1 ./ G2;
mag3 = abs(G3); angle3 = (angle(G3))*180/pi;

subplot(2,1,1)
plot(omega,mag3)
axis tight, label('',18,' ','Magnitude',18)
subplot(2,1,2) 
plot(omega,angle3)
axis tight, label('',18,'w (rad/s)','Phase',18)






