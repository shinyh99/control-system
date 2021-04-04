% X(s)/F(s) = 1/(M*s^2 + b*s + k)

%% First simulation using Laplace equation
sim_time = 100;
F = 10;
M = 1;
b = 0.1;
k = 20;
sim('TransferFunctionModel_trial');