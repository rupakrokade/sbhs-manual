L1 = 10; tau1 = 90; k1 = 0.62; Ts = 0.4;
L2 = 10; tau2 = 105; k2 = 0.66;



R1 = k1/tau1; a1 = R1*L1;

//Proportional controller
//kp = 1/a1; kc = kp;
//et = setpoint - temp;
//CO = CObias + kc*et

//PI controller
//kpi = 0.9/a1; taui = 3*L1;
//kc = kpi;
//et = setpoint - temp;
//eti = eti + et;
//CO = CObias + kc*(et + (eti*Ts)/taui);

//PID controller
kpid = 1.2/a1; taui = 2*L1; taud = 0.5*L1; 
et = setpoint - temp; etd = et - et1;
eti = eti + et; kc = kpid;

CO = CObias + kc*(et + (eti*Ts)/taui + (etd*taud)/Ts);
