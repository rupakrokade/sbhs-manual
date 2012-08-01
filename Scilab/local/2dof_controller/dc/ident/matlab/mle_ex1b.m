L = []; xaxis = []; n = 10; y = 6;
for w = 0:0.01:1,
  L_y = factorial(n)/(factorial(y)*factorial(n-y)) ...
      * w^y * (1-w)^(n-y);
  L = [L L_y]; 
  xaxis = [xaxis w];
end
plot(xaxis,L), xlabel('w'), ylabel('L(w|n=10,y=6)')
grid


