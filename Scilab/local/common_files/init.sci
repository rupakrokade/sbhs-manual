function status = init(port)
    global handl
    
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
endfunction