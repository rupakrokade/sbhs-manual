// Updated(18-7-07)
// 4.2
// Plot of -0.9^n1(-n-1)

a = 0.9;
n = -10:20;
y = zeros(1,size(n,'*'));
for i = 1: length(n)
    if n(i)<= -1,
        y(i) = -(a^n(i));
        else y(i) = 0;
    end
end
stem(n,y)
label('u2',4,'Time(n)','-0.9^n1(-n-1)',4)



