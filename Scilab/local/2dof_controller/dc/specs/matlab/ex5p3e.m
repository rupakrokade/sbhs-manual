yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; r = 1; vec = [];
for i = 1:100,
    e = r - yold;
    u = 0.8812*uold+6*(e-0.9802*eold);
    y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
    vec = [vec; [u,y]];
    uolder = uold; uold = u; yolder = yold; yold = y; eold = e;
end

plot(vec(:,2))
xlabel('Sample Points')
ylabel('Plant Output y(n)')
title('Plant Output as a Function of Sample number')
pause
print -dps 
plot(vec(:,1))
xlabel('Sample Points')
ylabel('Control Effort u(n)')
title('Control Effort as a Function of Sample number')
pause
print -dps 
