w = linspace(0.001,pi,1000);
a = linspace(0.001,0.999,100);
lena = length(a);
omega1 = []; lead1 = [];
factor = 0.9;
for i = 1:lena,
    zero = a(i);
    pole = factor*zero;
    sys = tf([1 -zero],[1 -pole],-1);
    [mag,phase] = bode(sys,w);
    [y,j] = max(phase);
    omega1 = [omega1 w(j)];
    lead1 = [lead1 y];
%    comega = (pole+zero)/(pole*zero+1);
%    clead = zero-pole;
%    cleadi = sqrt((1-zero^2)*(1-pole^2));
%    clead = clead/cleadi;
end
omega2 = []; lead2 = [];
factor = 0.7;
for i = 1:lena,
    zero = a(i);
    pole = factor*zero;
    sys = tf([1 -zero],[1 -pole],-1);
    [mag,phase] = bode(sys,w);
    [y,j] = max(phase);
    omega2 = [omega2 w(j)];
    lead2 = [lead2 y];
end

omega3 = []; lead3 = [];
factor = 0.5;
for i = 1:lena,
    zero = a(i);
    pole = factor*zero;
    sys = tf([1 -zero],[1 -pole],-1);
    [mag,phase] = bode(sys,w);
    [y,j] = max(phase);
    omega3 = [omega3 w(j)];
    lead3 = [lead3 y];
end

omega4 = []; lead4 = [];
factor = 0.3;
for i = 1:lena,
    zero = a(i);
    pole = factor*zero;
    sys = tf([1 -zero],[1 -pole],-1);
    [mag,phase] = bode(sys,w);
    [y,j] = max(phase);
    omega4 = [omega4 w(j)];
    lead4 = [lead4 y];
end

    subplot(2,1,1), plot(lead1,omega1,'-',...
    lead2,omega2,':', lead3,omega3,'-.',lead4,omega4,'--')
    legend('f = 0.9','f = 0.7','f = 0.5','f = 0.3')
ylabel('Maximum frequency, in rad/sample'), grid
pause
  subplot(2,1,2), plot(lead1,a,'-',lead2,a,':',lead3,a,'-.',lead4,a,'--')
ylabel('Zero location (b)')
xlabel('Maximum lead generated, in degrees'), grid
