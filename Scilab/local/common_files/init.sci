global filename m
function status = init(port)
    global handl filename
    
    OS = getos();
    
    if OS == string('Linux')
        port_num = port(1);
        handl = openserial(port_num,"9600,n,8,0")
    else
        port_num = port(2);
        handl = openserial(port_num,"9600,n,8")
    end

if (ascii(handl) ~= [])
  status = string('COM PORT OPENED')
else
    status = string('ERROR: Check port number or USB connection')
end

m = 1;

dt = getdate();
year = dt(1);
month = dt(2);
day = dt(6);
hour = dt(7);
minutes = dt(8);
seconds = dt(9);


file1 = strcat(string([year month day hour minutes seconds]),'-');
string txt;
filename = strcat([file1, "txt"],'.');

endfunction
