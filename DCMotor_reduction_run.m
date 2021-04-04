close all;
clear;

%% Define parameters
sim_time = 10;
step_size = 0.01;
V = 1;
J = 3.2284E-6;
b = 3.5077E-6;
Kb = 0.0274;
Kt = 0.0274;
R = 4;
L = 2.75E-6;
Kp = 0.5;
Ki = 1;
Kd = 0;
result = sim('DCMotor_reduction');