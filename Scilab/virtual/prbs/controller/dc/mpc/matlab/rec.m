function [E,dE,F,dF] = rec(A,C,k)
Abar = A(2:length(A));
dAbar = length(Abar)-1;
F = C;
dF = length(F)-1;
E = 1;
for i = 1:k-1,
    Fbar = F(2:length(F));
    [Fnew,dFnew] = poladd(Fbar,dF-1,-Abar*F(1),dAbar);
    Enew = [E Fnew(1)];
    F = Fnew;
    dF = dFnew;
    E = Enew;
end
Fbar = F(2:length(F));
[F,dF] = poladd(Fbar,dF-1,-Abar*F(1),dAbar);
dE = length(E)-1;
