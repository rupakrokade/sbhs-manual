// For scilab 5.1.1 or lower version users, 
//use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y p q xk_old

p = 40; //prediction horizon
q = 4;  // control horizon
xk_old = zeros(8,1);

fncr =  'scilabread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; //initialising error count for network error
m =1;
exec ("mpc.sci");
exec("mpc_run.sci");

fdfh = mopen('scilabwrite.sce');
mseek(0);
b = mgetl(fdfh,1); 
a = mgetl(fdt,1);
mclose(fdfh);


   A = [0.1,0,100,m];
   fdfh = file('open','scilabwrite.sce','unknown');
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(2000);
   a = mgetl(fdt,1);
   mseek(0);    
   if a~= [] //open xcos only if communication is through
      xcos('mpc.xcos');
   else
     disp("NO NETWORK CONNECTION!");
     return
end
