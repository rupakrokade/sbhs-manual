n=0:16;
subplot(2,2,1), stem(n,cos(n*pi/8))
grid,xlabel('n'),ylabel('cos(n*pi/8)')
subplot(2,2,2), stem(n,cos(n*pi/4))
grid,xlabel('n'),ylabel('cos(n*pi/4)')
subplot(2,2,3), stem(n,cos(n*pi/2))
grid,xlabel('n'),ylabel('cos(n*pi/2)')
subplot(2,2,4), stem(n,cos(n*pi))
grid,xlabel('n'),ylabel('cos(n*pi)')
