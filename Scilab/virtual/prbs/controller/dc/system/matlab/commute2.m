n=0:10;
A = 0.5.^n;
u = 1.^n;
z = conv(u,A);
y1 = z+2;
z = u+2;
y2 = conv(z,A);
y1-y2