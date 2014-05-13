t = 0:0.01:4; 
t1=[0 1 2 3 4]; y=cos(2*pi*t1/8);
plot(t,cos(2*pi*t/8),t,cos(2*7*pi*t/8),t1,y,'ko')
label('',18,'t','coswt',18)
