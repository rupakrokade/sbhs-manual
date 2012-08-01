yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; eolder = 0;
r = 1; vec = [];
for i = 1:100,
    e = r - yold;
    u = -0.0604*uold + 0.9263*uolder ...
      + 33.81* (e - 1.669*eold + 0.6753*eolder);
    y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
    vec = [vec; [u,y]];
    uolder = uold; uold = u; yolder = yold; yold = y; eolder = eold; 
    eold = e;
end

plot(vec(:,2))
xlabel('Sample Points')
ylabel('Plant Output y(n)')
title('Plant Output as a Function of Sample number')
pause
%print -dps 
plot(vec(:,1))
xlabel('Sample Points')
ylabel('Control Effort u(n)')
title('Control Effort as a Function of Sample number')
pause
%print -dps 
