f = []; xaxis = []; n = 10; w = 0.4;
for y = 0:10,
  f_y = factorial(n)/(factorial(y)*factorial(n-y)) ...
      * w^y * (1-w)^(n-y);
  f = [f f_y]; 
  xaxis = [xaxis y];
end
stem(xaxis,f), xlabel('y'), ylabel('f(y|n=10,w=0.4)')

