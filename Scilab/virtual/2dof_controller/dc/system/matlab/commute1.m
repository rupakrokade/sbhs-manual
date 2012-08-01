n=0:10;
A = 0.5.^n;
B = 0.9.^n;
u = 1.^n;
z = conv(u,A);
y1 = conv(z,B);
z = conv(u,B);
y2 = conv(z,A);
y1-y2