close all;
clear;

m = 1000;
b = 50;
r = 10;

s = tf('s');
Plant_TF = 1/(m*s + b);

Kp = 5000;
Controller = pid(Kp);

TF_ClosedLoop = feedback(Controller*Plant_TF, 1);


%% Use Kp equal to 100 and a reference speed of 10m/s
t = 0:0.1:20;
figure
step(r*TF_ClosedLoop, t)
axis([0 20 0 10])

%% PID Controller
Kp = 800;
Ki = 40;
Controller = pid(Kp, Ki);

TF_CloseedLoop = feedback(Controller*Plant_TF, 1);

figure
step(r*TF_CloseedLoop, t)
axis([0 20 0 10])