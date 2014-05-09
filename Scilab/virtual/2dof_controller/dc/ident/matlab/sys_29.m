u = [1 2]; y = [0 1 2];
ruy = xcov(u,y);
mu = mean(u);
u_zm = u - mu;
y_zm = y - mu;
ruy_zm = xcov(u_zm,y_zm);
