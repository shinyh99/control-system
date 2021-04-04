close all;

%% Load Data
Batt = xlsread('UDDS_50.csv');
t = Batt(:,1);
I = Batt(:,2);

%% Plotting
plot(t, I)
xlabel('Time [sec]')
ylabel('Current [A]')

%% Define parameters
R = 0.1;
K0 = 3;
K1 = 0.01;
K2 = 0.01;
K3 = 0.01;
K4 = 0.01;

Cn = 5.4 * 3600; % 5.4 amperes*sec
DeltaT = 0.1;

%% Combined Model
I = -1*I;
SOC = 0.9; % 90 percents

SOC_list = [];
V_list = [];
for k = 1:1:length(I)
    
    V = K0 - R * I(k) - K1/SOC - K2 * SOC + K3 * log(SOC) + K4 * log(1 - SOC);
    
    
    SOC = SOC - (DeltaT/Cn) * I(k);
    SOC_list = [SOC_list SOC];
    V_list = [V_list V];
    
end

%% plot
plot(SOC_list)
hold on
plot(V_list)
plot(I)