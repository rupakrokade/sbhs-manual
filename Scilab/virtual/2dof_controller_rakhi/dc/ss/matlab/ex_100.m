A = [-1 -2 0.5; 1 0 0; 0 1 0];
b = [1;0;0];
p = [0 0];
K = place(A,b,p)
??? Error using ==> place
P must have the same number of states as A.

p = [0 0 0];
K = place(A,b,p)
??? Error using ==> place
Can't place poles with multiplicity greater than rank(B).

A

A =

   -1.0000   -2.0000    0.5000
    1.0000         0         0
         0    1.0000         0

b

b =

     1
     0
     0

diary ex_500.m
