mode(0);
// For scilab 5.1.1 or lower version users, use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y limits sampling_time m

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//

exec ("imc_virtual.sci");

ok = init();    

   if ok~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('imc.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end
