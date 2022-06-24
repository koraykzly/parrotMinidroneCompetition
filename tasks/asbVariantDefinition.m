%% asbVariantDefinition.m - Variants definiton
% This script initializes the variant objects for the quadcopter model.

% Copyright 2017-2018 The MathWorks, Inc.

% Command
VSS_COMMAND_SIGBLDR = Simulink.Variant('VSS_COMMAND==0');
VSS_COMMAND_JOYSTICK = Simulink.Variant('VSS_COMMAND==1');
VSS_COMMAND_PRESAVED = Simulink.Variant('VSS_COMMAND==2');
VSS_COMMAND_SPREADSHEET = Simulink.Variant('VSS_COMMAND==3');

% Sensors
VSS_SENSORS_FEEDTHROUGH = Simulink.Variant('VSS_SENSORS==0');
VSS_SENSORS_DYNAMICS = Simulink.Variant('VSS_SENSORS==1');

% Environment
VSS_ENVIRONMENT_CST = Simulink.Variant('VSS_ENVIRONMENT==0');
VSS_ENVIRONMENT_VARIABLE = Simulink.Variant('VSS_ENVIRONMENT==1');

% Vehicle
VSS_VEHICLE_LINEAR = Simulink.Variant('VSS_VEHICLE==0');
VSS_VEHICLE_NONLINEAR = Simulink.Variant('VSS_VEHICLE==1');
