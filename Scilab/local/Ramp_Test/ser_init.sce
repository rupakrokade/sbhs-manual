mode(0)
global filename
//**Sampling Time**//
sampling_time = 1;
///////****/////////
m=1;

port1 = '/dev/ttyUSB0';//For linux users
port2 = 'COM2';//For windows users

res=init([port1 port2]);
disp(res)



