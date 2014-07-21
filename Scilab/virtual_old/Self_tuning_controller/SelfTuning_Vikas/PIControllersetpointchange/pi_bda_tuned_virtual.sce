mode(0)
global fdfh fdt fncr fncw m err_count y limits sampling_time m

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//
exec ("pi_bda_tuned_virtual.sci");

ok = init();    

   if ok~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('pi_tuned_virtual.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end
