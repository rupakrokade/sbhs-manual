w = linspace(0.001,pi,1000);
a = linspace(0.001,0.999,100);
lena = length(a);
omega = []; lead = [];
for i = 1:lena,
    zero = a(i);
    pole = 0.9*zero;
    sys = tf([1 -zero],[1 -pole],-1);
    [mag,phase] = bode(sys,w);
    [y,j] = max(phase);
    omega = [omega w(j)];
    lead = [lead y];
    comega = (pole+zero)/(pole*zero+1);
    clead = zero-pole;
    clead1 = sqrt((1-zero^2)*(1-pole^2));
    clead = clead/clead1;
%    [w(j) acos(comega) y atan(clead)*180/pi]
end
subplot(2,1,1), plot(lead,omega)
ylabel('Frequency, in radians'), grid
pause
subplot(2,1,2), plot(lead,a)
ylabel('Zero location')
xlabel('Lead generated, in degrees'), grid
