%% first Simulation
Sim_Time = 20;
F = 1;
M = 1;
b = 1;
k = 20;
sim('MassSpringDamper');

%% Let's Try to simulate the system with no damper
Sim_Time = 20;
F = 1;
M = 1;
b = 0;
k = 20;
sim('MassSpringDamper');

%% Let's simulate the system with less damper
Sim_Time = 20;
F = 1;
M = 1;
b = 0.1;
k = 20;
sim('MassSpringDamper');

%% Let's simulate the system with larger damper
Sim_Time = 20;
F = 1;
M = 1;
b = 3;
k = 20;
sim('MassSpringDamper');

