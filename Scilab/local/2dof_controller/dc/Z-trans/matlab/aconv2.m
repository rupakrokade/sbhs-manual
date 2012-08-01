a = 0.9;
n = -10:20;
y = zeros(size(n));
for i = 1:length(n)
    if n(i)<=-1, 
       y(i) = -(a^n(i)); 
    end
end
axes('FontSize',18);
o = stem(n,y);
set(o(1),'Marker','.');
label('u2',18,'Time(n)','-(0.9)^n 1(-n-1)',18)

