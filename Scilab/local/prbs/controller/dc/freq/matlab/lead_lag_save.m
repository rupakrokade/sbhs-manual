w = logspace(-4,0.5,100);
sys = tf([1 -1],[1 -0.99],-1);
bode(sys,w);
hold
sys = tf([1 -1],[1 -0.9],-1);
bode(sys,w);
sys = tf([1 -1],[1 -0.1],-1);
bode(sys,w);
sys = tf([1 -1],[1 -0.01],-1);
bode(sys,w);
pause
hold
sys = tf([1 -1],[1 -0.8],-1);
bode(sys,w);
pause
sys = tf([1 -0.9],[1 -0.8],-1);
bode(sys,w);
hold
sys = tf([1 -0.9],[1 -0.6],-1);
bode(sys,w);
sys = tf([1 -0.9],[1 -0.4],-1);
bode(sys,w);
sys = tf([1 -0.9],[1 -0.2],-1);
bode(sys,w);
sys = tf([1 -0.9],[1 -0],-1);
bode(sys,w);


