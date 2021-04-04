% close all;
clear;

% V(s)/S(s) = 1/(M*S + b), where V is velocity

%% No damper simulation
sim_time = 7.0;
step_value = 0.01;
b = 0.1; % drag coefficient
M = 1;
step_final = 10;

%% PID P controller only
% Kp = 1000; % increasing P overshoots the value
% Ki = 0;
% Kd = 0;

%% PID parameters
Kp = 1;
Ki = 1;
Kd = 0;

%% Run simulation
result = sim('PID_vehicle');

%% Draw
figure
subplot(4,1,1)
plot(result.tout, result.in1.data)
title("Full")
hold all
plot(result.tout, result.out1.data)

subplot(4,1,2)
plot(result.tout, result.in2.data)
title("Model Tansfer Fcn")
hold all
plot(result.tout, result.out2.data)

subplot(4,1,3)
plot(result.tout, result.in3.data)
title("PID Transfer Fcn")
hold all
plot(result.tout, result.out3.data)

subplot(4,1,4)
plot(result.tout, result.in4.data)
title("All Transfer Fcn")
hold all
plot(result.tout, result.out4.data)

