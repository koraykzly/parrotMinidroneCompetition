function generateFlightCode()
% GENERATEFLIGHTCODE generates code for deployment in the Parrot (R) mini
% drone. It requires Embedded Coder (R) and Simulink Coder (TM).

% Copyright 2017-2018 The MathWorks, Inc.

model = 'flightControlSystem';
open_system(model);
%Check for capability of code generation
set_param(model, 'GenCodeOnly','on');
%Disable the report generation
set_param(model, 'GenerateReport', 'Off');
rtwbuild(model);
%Reset to off and enable direct deployment on hardware
set_param(model, 'GenCodeOnly','off');
