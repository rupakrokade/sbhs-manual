// To load the serial toolbox and open the serial port
//exec loader.sce
exec ../common_files/loader.sce
exec step_test.sci

port1 = '/dev/ttyUSB0';//For linux users
port2 = 'COM2';//For windows users

init([port1 port2])


