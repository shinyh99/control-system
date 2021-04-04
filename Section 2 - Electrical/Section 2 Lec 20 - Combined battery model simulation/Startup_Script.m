%% Code Description: Code used to simulate a combined battery model

%% Load Input Current Data for a UDDS Cycle
Batt = xlsread('UDDS_50.csv', 'A69:AD13771');
RecordingTime          = Batt(:,1);
I                      = -Batt(:,2);
%% Simulate the Experimental Battery
[SOC_Actual,...
 V_Actual]     = Experimental_BatteryModel(I, RecordingTime);
%% Ploting
figure
subplot(3,1,1)
plot(RecordingTime/60, SOC_Actual * 100);
xlabel('Time [min]'); ylabel('SOC [%]'); grid minor

subplot(3,1,2)
plot(RecordingTime/60, V_Actual)
xlabel('Time [min]'); ylabel('TerminalVoltage [V]');
grid minor

subplot(3,1,3)
plot(RecordingTime/60, I); xlabel('Time [min]'); ylabel('Current [I]'); grid minor
