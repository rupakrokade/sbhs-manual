dll_link = c_link('serial');

//if not loaded - load it
if ~dll_link,
  addinter('serial.dll','serial',[ 'opencom';'closecom'; 'writecom'; 'writebincom';'readbincom';'resetcom';'getcomhandles']);
end;

com_config = tlist(['Config';'port';'baudrate';'nbits';'parity';'stopbits';'protocol'],1,9600,8,0,0,0);
handl = opencom(com_config);   
closecom(getcomhandles())   // closes all by serial.dll opened comm ports

//ok = writebincom(handl,[253]); fan
//ok = writebincom(handl,[10]);

//ok = writebincom(handl,[254]); // light
//ok = writebincom(handl,[25]);

//[inbytes,ok,nbytes] = readbincom(handl,3);
