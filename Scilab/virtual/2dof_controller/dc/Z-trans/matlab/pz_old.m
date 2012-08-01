A = axes('FontSize',14);
set(get(A,'Xlabel'),'FontSize',14);
C = circle([0,0],1,100)
z = [0 5/12];
p = [1/2 1/3];
hold on
pts = plot(real(z),imag(z),'bo',...
           real(p),imag(p),'rx')
hold off
axis square
xlim([-1.1 1.1]);
ylim([-1.1 1.1]);
grid
title('Pole-Zero Plot')
xlabel('Real(z)')
ylabel('Imaginary(z)')
