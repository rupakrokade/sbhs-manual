z = [0;5/12];
p = [1/2;1/3];
A = axes('FontSize',18);
set(get(A,'Xlabel'),'FontSize',18);
zplane(z,p);
title('Pole-Zero Plot')
xlabel('Real(z)')
ylabel('Imaginary(z)')
grid

