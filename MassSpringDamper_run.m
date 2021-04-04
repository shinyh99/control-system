close all;
clear;

% x_dotdot = 1/m(F - b*x_dot - k*x)

%% No damper simulation
sim_time = 10.0;
k = 20;
b = 0;
M = 1;
F = 1;
sim('MassSpringDamper_trial.slx');

%% Small damper simulation
sim_time = 10.0;
k = 20;
b = 0.5;
M = 1;
F = 1;
sim('MassSpringDamper_trial.slx');

%% Large damper simulation
sim_time = 10.0;
k = 20;
b = 2;
M = 1;
F = 1;
sim('MassSpringDamper_trial.slx');