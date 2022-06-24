function cleanUpProject()
%cleanUpProject   Clean up local customizations of the environment
% 
%   Clean up the environment for the current project. This function undoes
%   the settings applied in "setUpProject". It is set to Run at Shutdown.

%   Copyright 2013-2018 The MathWorks, Inc.

% Clear variables added to the base workspace
if ~isempty(evalin('base','who(''initVars'')'))
    evalin('base','clear(initVars{:})');
end

% Close the Track Builder app, if opened.
figureHandles = findall(0, 'Type', 'figure');
allFigureNames = get(figureHandles, 'Name');
indexTrackBuilderApp = strcmp(allFigureNames,'Competition Track Builder');
trackBuilderAppHandle = figureHandles(indexTrackBuilderApp);
if(~isempty(trackBuilderAppHandle))
    close(trackBuilderAppHandle);
end
           