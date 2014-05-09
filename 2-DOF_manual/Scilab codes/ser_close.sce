dll_link = c_link('serial');

//if not loaded - load it
if ~dll_link,
  addinter('serial.dll','serial',[ 'opencom';'closecom'; 'writecom'; 'writebincom';'readbincom';'resetcom';'getcomhandles']);
end;
closecom(getcomhandles())   // closes all by serial.dll opened comm ports

