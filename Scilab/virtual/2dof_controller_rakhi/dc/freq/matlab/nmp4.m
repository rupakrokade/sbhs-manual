omega = linspace(-pi,pi);
ejw = exp(-j*omega);

%G1 = -1.5*(1-0.4*ejw) .* (1+0.8*ejw) ./ (1-0.5*ejw);
%mag1 = abs(G1);
%angle1 = angle(G1) * 180/pi;
%G2 = 0.6*(1-2.5*ejw) .* (1+0.8*ejw) ./ (1-0.5*ejw);
%mag2 = abs(G2);
%angle2 = angle(G2) * 180/pi;

g1 = -1.5*(1-0.4*ejw); g2 = -0.25*(1-0.8*ejw); g3 = -(1-0.5*ejw);
mag1 = abs(g1) .* abs(g2);
angle1 = (angle(g1)+angle(g2))*180/pi;
g1nm = 0.6*(1-2.5*ejw);
mag2 = abs(g1nm) .* abs(g2);
angle2 = (angle(g1nm)+angle(g2))*180/pi;
g2nm = 0.2*(1-1.25*ejw); g3nm = 0.5*(1-2*ejw);
mag3 = abs(g1nm) .* abs(g2nm);
angle3 = (angle(g1nm)+angle(g2nm))*180/pi;

subplot(2,1,1)
plot(omega,mag1,omega,mag2,'--',omega,mag3,':')
axis tight, label('',18,' ','Magnitude',18)
subplot(2,1,2) 
plot(omega,angle1,omega,angle2,'--',omega,mag3,'-')
axis tight, label('',18,'w (rad/s)','Phase',18)






