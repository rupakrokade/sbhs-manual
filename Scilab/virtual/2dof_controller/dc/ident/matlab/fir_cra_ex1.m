% Create the plant and noise model objects
var = 0.05;
process_mod = idpoly(1,[0 0.6 -0.2], 1, 1,...
     [1 -0.5],'Noisevariance',var,'Ts',1);

% Create input sequence
u = idinput(2555,'prbs',[0 0.2],[-1 1]);
xi = randn(2555,1);

% Simulate the process
y = sim([u xi],process_mod);

% Plot y as a function of u and xi
subplot(3,1,1), plot(y(1:500)),
label('',18,'','y',18)
subplot(3,1,2), plot(u(1:500))
label('',18,'','u',18)
subplot(3,1,3), plot(var*xi(1:500))
label('',18,'n','xi',18)

% Build iddata objects
z = iddata(y,u,1);

% Compute impulse response using 
% CRA after removal of means
figure; [ir,r,cl] = cra(detrend(z,'constant')); 
hold on

% Compare the first 10 impulse response 
% computed from G(q)
ir_act = filter([0 0.6 -0.2],[1 -0.5],...
         [1 zeros(1,9)]);

% Plot the actual IR
set(gca,'XLim',[0 9]); grid on;
h_act = stem((0:9),ir_act,'ro','filled');

% Add legend
ch_f = get(gcf,'Children');
ch_f2 = get(ch_f,'Children');
legend([ch_f2(5) h_act(1)],...
       {'Estimated'; 'Actual'});
