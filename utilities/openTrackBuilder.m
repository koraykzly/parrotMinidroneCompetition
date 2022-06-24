function openTrackBuilder()
% openTrackBuilder -  Checks if the Competition Track Builder is open and 
% opens if it is not

%   Copyright 2020 The MathWorks, Inc.

% Open the Track Builder app, if not opened.
figureHandles = findall(0, 'Type', 'figure');
allFigureNames = get(figureHandles, 'Name');
indexTrackBuilderApp = strcmp(allFigureNames,'Competition Track Builder');
trackBuilderAppHandle = figureHandles(indexTrackBuilderApp);
if(isempty(trackBuilderAppHandle))
    run('drone_track_builder.mlapp')
end

end