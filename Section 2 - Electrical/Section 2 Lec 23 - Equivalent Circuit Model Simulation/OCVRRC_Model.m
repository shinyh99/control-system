function [TerminalVoltage_Actual,...
          SOC_Actual] = OCVRRC_Model(Current)     
%% Code Description: 
% OCV-RRC Battery Model Simulation with known Parameters
%___________________________________________________
%% Define OCV-RRC Model Parameters 
load soc_ocv

R1      = 0.0049;
R0      = 0.0096;
C1      = 3860.14;
Tao     = C1 * R1;

Ip_old  = 0;
eta     = 1;   
%% Define Model Fixed/known Parameteres 
DeltaT      = 1;

Cn          = 5.4 * 3600;
SOC_init    = 0.8;
X           = SOC_init;

%% Start Simulating the Model
SOC_Actual               = [];
TerminalVoltage_Actual   = [];

%% OCV-RRC Simulation
iCurrent   = length(Current);
for k      = 2 : 1 : iCurrent
    
   SOC     = X;
   OCV     = pchip(soc_ocv(:,1), soc_ocv(:,2), SOC);
   
   Ip_new = ( 1 - exp(-DeltaT/Tao) ) * Current(k)...
           + exp(-DeltaT/Tao) * Ip_old;
   
   TerminalVoltage = OCV - (R0  * Current(k)) - R1 * Ip_new;   
   
   Ip_old   = Ip_new; 
                       
    U       = Current(k);
    CoeffB3 = -(eta * DeltaT/Cn);
    B       = CoeffB3;
    A       = 1;
    X       = A * X + B * U;

    TerminalVoltage_Actual = [TerminalVoltage_Actual; TerminalVoltage];
    SOC_Actual             = [SOC_Actual; SOC*100];

end

