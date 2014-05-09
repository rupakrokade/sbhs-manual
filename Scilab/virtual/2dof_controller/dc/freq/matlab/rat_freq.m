n=0:16; t = 1:0.1:16;
subplot(2,2,1), stem(n,cos(10*pi*n))
grid,xlabel('n'),ylabel('cos(10*pi*n)')
subplot(2,2,2), stem(n,cos(pi*n/2))
grid,xlabel('n'),ylabel('cos(pi*n/2)')
subplot(2,2,3), stem(n,cos(2*2^0.5*pi*n))
grid,xlabel('n'),ylabel('cos(2*2^{0.5}*pi*n)')
  subplot(2,2,4), plot(m,cos(2*2^0.5*t))
grid,xlabel('n'),ylabel('cos(2*2^{0.5}*t)')
