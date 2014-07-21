mode(0)

global fdfh fdt fncr fncw m err_count y p q xk_old sampling_time

p = 40; //prediction horizon
q = 4;  // control horizon
xk_old = zeros(8,1);

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//

exec ("mpc.sci");
exec("mpc_run.sci");

ok = init();    

   if ok~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('mpc.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end