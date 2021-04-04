close all;

Batt = xlsread('Current.csv', 'A3:B174277');

T = Batt(:,1);
I = Batt(:,2);

I = -1 * I;

%%
R0 = 0.005;
R1 = 0.001;
C1 = 3900;
Tao = R1 * C1;

%%
DeltaT = 1;
Cn = 5.4 * 3600;
SOC_init = 0.8; % 80 percents

SOC_vec = [];
V_vec = [];

%% Model

Ip_old = 0;
OCV = 3;

for k = 1:1:length(I)
    SOC = SOC - (DeltaT * I(k) / Cn);
    
    Ip_new = (1- exp(-DeltaT/Tao)) * I(k) + exp(-DeltaT/Tao) * Ip_old;
    VT = OCV - (R0 * I(k)) - (R1 * Ip_new);    
    
    V_vec = [V_vec VT];
    SOC_vec = [SOC_vec SOC];
end


%%
PLOT(V_vec)
figure
plot(SOC_vec)

