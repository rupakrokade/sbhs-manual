n=0:16;
w=0:0.01:2*pi;
subplot(1,1,1), plot(w,cos(w),w,cos(w)+0.1*cos(40*w)), axis([0 7 -2 2]), ...
grid, xlabel('w'), ylabel('u(w)')
pause
subplot(2,1,1), plot(n,cos(2*pi*n/16),'o',n,cos(2*pi*n/2),'*', ...
n, cos(2*pi*n/16)), axis([0 16 -2 2]), grid, xlabel('n'), ylabel('u(n)')
subplot(2,1,2), plot(n,cos(2*pi*n/16)+0.1*cos(2*pi*n/2),'o', ...
n, cos(2*pi*n/16)), grid, xlabel('n'), ylabel('u(n)')