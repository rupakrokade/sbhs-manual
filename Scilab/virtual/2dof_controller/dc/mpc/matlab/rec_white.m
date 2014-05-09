function [E,dE,F,dF] = rec_white(A,k)
Abar = A(2:length(A));
dAbar = length(Abar)-1;
E = 1;
if (k == 1),
   F = -Abar;   
   dF = length(F) - 1;
elseif (k > 1),
   F = 1;
   Fbar = [];
   for i = 1:k-1,
       if isempty(Fbar)
          F = -Abar*F(1);
       else
          [F,dF] = poladd(Fbar,length(Fbar)-1,-Abar*F(1),dAbar);
       end
       E = [E F(1)];
       Fbar = F(2:length(F));
   end
   Fbar = F(2:length(F));
   if isempty(Fbar)
      F = -Abar*F(1);
      dF = length(F)-1;
   else
      [F,dF] = poladd(Fbar,length(Fbar)-1,-Abar*F(1),dAbar);
   end
end
dE = length(E)-1;
