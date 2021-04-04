% close all;
clear;

% x_dotdot = 1/m(F - b*x_dot - k*x)

%% No damper simulation
sim_time = 7.0;
step_value = 0.01;
k = 20;
b = 10;
M = 1;
F = 10;

%% PID P controller only
% Kp = 500; % increasing P overshoots the value
% Ki = 0;
% Kd = 0;

%% PID parameters
Kp = 350;
Ki = 300;
Kd = 50;

%% Run simulation
result = sim('PID_SpringDamper');

%% Draw
figure
plot(result.tout, result.in.data)
hold all
plot(result.tout, result.out.data)
