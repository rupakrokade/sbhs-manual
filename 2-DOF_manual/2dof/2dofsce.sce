mode(0);


global fdfh fdt fncr fncw m err_count y

fncr ='clientread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; // initialising error count for network error
m =1;
exec ("twodof1.sci");

fdfh = mopen('clientwrite.sce');
mseek(0);
b = mgetl(fdfh,1); 
a = mgetl(fdt,1);
mclose(fdfh);

if a ~= [] 
  if b~= []
    disp("ERROR!EMPTY THE CLIENTREAD AND CLIENTWRITE FILES");
    return
  else
    disp("ERROR!EMPTY THE CLIENTREAD FILE");
    return
  end
else  
  if b~= []
    disp("ERROR!EMPTY THE CLIENTWRITE FILE");
    return
    end;
   A = [0.1,m,0,251];
   fdfh = file('open','clientwrite.sce','unknown');
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(1000);
   a = mgetl(fdt,1);
   mseek(0);    
   if a~= []  // open xcos only if communication is through (ie rpely has come from server)
      xcos('2d.xcos');
   else
     disp("NO NETWORK CONNECTION!");
     return
end
