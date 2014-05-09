// Updated(18-7-07)
// 4.3
// Pole-zero plot using plzr
// plzr has legends, which are overlapped (by default)
// opt = "?" provides the option of placing the legend above the default one

zero = [0 5/12];
num = poly(zero,'z',"roots");
pole = [1/2 1/3];
den = poly(pole,'z',"roots");
h = syslin('d',num./den);
plzr(h);
label('Pole-Zero Plot',4,'Real(z)','Imaginary(z)',4); 
legends(['Zeros';'Poles'],[-9;-2],opt = "?");
