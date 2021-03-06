function ...
    [SOCActual,...
    TerminalVoltageActual] = Experimental_BatteryModel(I, Time)
%% Code Description: 
% function used to simulate experimental battery model with known parameters
% Author   : Ryan Ahmed


%% Define Battery Model Parameters
Current     = I;
DeltaT      = 0.1;
Cn          = 5.4 * 3600;
eta         = 1;
SOC         = 0.9;

%% Initalize Actual Model Parameters

R_plusActual    = 0.1;
R_minusActual   = 0.1;
K0              = 3;
K1              = 0.01;
K2              = 0.01;
K3              = 0.01;
K4              = 0.01;
%% Run Battery MActualodel
SOCActual               = [];
TerminalVoltageActual   = [];
ik = length(Current);
for k = 1 : 1 : ik
    % SOC Update
    U           = Current(k);
    CoffB3      = -(eta * DeltaT / Cn);
    SOC         = SOC + (CoffB3 * U);  
    
    %% Run Updated Model
    if Current(k) >= 0
        TerminalVoltage  = K0                         ...
                         - (R_plusActual  * Current(k))     ...
                         - K1/SOC                     ...
                         - K2*SOC                     ...
                         + K3*log(SOC)                ...
                         + K4*log(1-SOC)              ;
    else
        TerminalVoltage  = K0                         ...
                         - (R_minusActual  * Current(k))    ...
                         - K1/SOC                     ...
                         - K2*SOC                     ...
                         + K3*log(SOC)                ...
                         + K4*log(1-SOC)              ;
    end
    TerminalVoltageActual   = [TerminalVoltageActual; TerminalVoltage];
    SOCActual               = [SOCActual; SOC];
end
end