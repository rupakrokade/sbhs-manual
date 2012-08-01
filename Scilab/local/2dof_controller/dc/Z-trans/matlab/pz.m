% Pole zero plot
z = [0;5/12];
p = [1/2;1/3];
A = axes('FontSize',18);
[hz,hp,hl] = zplane(z,p);               % Get handle 
set(hz,'MarkerSize',12,'Color',[0 0 0]) % Set colour and size
set(hp,'MarkerSize',12,'color',[0 0 0])
label('Pole-Zero plot',18,'Real(z)','Imaginary(z)',18)

