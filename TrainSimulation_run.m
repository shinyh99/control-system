% F1: F - k*(x1 - x2) - mu*M1*g*x1_dot = M1*x1_dotdot
% F2 : k*(x1 - x2) - mu*M2*g*x2_dot M2*x2_dotdot

%% First simulation
M1 = 1;
M2 = 0.5;
k = 1;
F = 1;
mu = 0.02;
g = 9.8;
result = sim('TrainSimulation_trial');

figure
plot(result.x1_dot.data)
hold all
plot(result.x2_dot.data)
plot(result.Force.data)
plot(result.x1.data)


