%% Parameters Definition
M1 = 1;
M2 = 0.5;
k  = 1;
F  = 1;
Mu = 0.02;
g  = 9.8;

%% Model Simulation and Plotting
sim('TrainSimulation')
figure
plot(Velocity.data)
hold all
plot(Force.data)