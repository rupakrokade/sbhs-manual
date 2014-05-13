C = 0; D = 1; S = 1; R = 1; T = 1; R = 1;
[B,A,k] = d2filt(0.001987*[1 0.9931],...
                 conv([1 -1],[1 -0.9802]));
[zk,dzk] = zpowk(k);
N = 25*[1 -0.9802];
D = [1 -0.505];
Ts = 0.2; N_var = 0; st = 1; end_time = 10;
pause
stairs(t,u), grid
xlabel('Time, t (s)')
ylabel('Control effort u(n)')
title('Control effort as a function of sample number')
figure
stairs(t,y), grid
xlabel('Time, t (s)')
ylabel('Plant output y(n)')
title('Plant output as a function of sample number')
