mode(0);
// For scilab 5.1.1 or lower version users, use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y u_new r_old y_old u_old u_old_old u_old_old_old

u_new=1;
r_old=1;
y_old=1;
u_old=1;
u_old_old=1;
u_old_old_old=1;


fncr =  'clientread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; // initialising error count for network error
m =1;
exec ("twodof.sci");
  
   fdfh = file('open','clientwrite.sce','unknown');
   A = [0.1,m,0,251];
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(2000);
   a = mgetl(fdt,1);
   mseek(0);    
   if a~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('twodof.xcos');
   else
     disp("NO NETWORK CONNECTION!");
     return
end
