function [stop] = mpc(Tsp,fan) 
	global fdfh fdt fncr fncw m err_count stop p q xk_old heat temp heat_old
	
	heat = mpc_run(temp,heat_old,Tsp);

	[stop,temp] = comm(heat,fan);//Never edit this line
    plotting([heat fan temp Tsp],[0 40 25 0],[100 70 50 1000]);
    
    heat_old = heat;

return
endfunction
