%% Code Description: OCV-RRC Battery Model Simulation 

clc; close all; clear all
%% SOC-OCV Relationship for Lithium Polymer Battery
load soc_ocv % Artifical SOC-OCV Data
plot(soc_ocv(:,1)*100, soc_ocv(:,2))
xlabel('SOC [%]'); ylabel('OCV [V]'), title('SOC-OCV - C/15');
%% Load Current Profile for a driving cycle
Batt = xlsread('Current.csv', 'A3:B174277');
LiPoly.RecordingTime                  = Batt(:,1);
LiPoly.PEC_Measured_Current           = Batt(:,2);

%% Resample the Data from 10 Hz to 1 Hz
LiPoly.PEC_Measured_Current  = LiPoly.PEC_Measured_Current(1:10:end);
LiPoly.RecordingTime         = LiPoly.RecordingTime(1:10:end);
% Current Def. is reversed (+) Discharging, (-) Charging
LiPoly.PEC_Measured_Current_R = - LiPoly.PEC_Measured_Current;
%% Simulate the OCVRRC Model
[LiPoly.Terminal_Voltage, LiPoly.SOC] = OCVRRC_Model(LiPoly.PEC_Measured_Current_R );
%% Plot Current
figure
subplot(3,1,1);
plot(LiPoly.RecordingTime(1:length(LiPoly.Terminal_Voltage))/3600,...
     LiPoly.Terminal_Voltage, '--', 'LineWidth', 1.5);
legend('V'); ylabel('Voltage [V]'); xlabel('Time [h]'); title('I, V, SOC - OCVRRC Battery Model')
subplot(3,1,2);
plot(LiPoly.RecordingTime(1:length(LiPoly.SOC))/3600, LiPoly.SOC, '--', 'LineWidth', 1.5);
legend('SOC'); ylabel('SOC [%]'); xlabel('Time [h]');
subplot(3,1,3);
plot(LiPoly.RecordingTime/3600, LiPoly.PEC_Measured_Current_R, '--', 'LineWidth', 1.5);
legend('Current Input'); ylabel('Current [A]'); xlabel('Time [h]');
