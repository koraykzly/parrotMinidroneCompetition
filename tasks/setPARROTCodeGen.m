function setPARROTCodeGen()
% SETPARROTCODEGEN This function sets the appropriate settings
% for code generation for the controller. This is a private function, not
% meant to be used directly.

% Copyright 2017-2018 The MathWorks, Inc.

% Check if the flight control system model and its children are open
modelList = {'flightControlSystem'};

for k = 1:length(modelList)
    isFCSLoaded = bdIsLoaded(modelList{k});
    if ~isFCSLoaded
        load_system(modelList{k});
    end
    
    % Set the hardware target toolchain
    switch evalin('base','model')
        case 'Mambo'
            set_param(modelList{k},'HardwareBoard','PARROT Mambo',...
                'MatFileLogging','on');
        case 'RollingSpider'
            set_param(modelList{k},'HardwareBoard','PARROT Rolling Spider',...
                'MatFileLogging','on');
    end
    
    % Set image processing settings - It only applies to th e
    % flightControlSystem model
    if k==1
        set_param([modelList{k} '/Image Processing System'],'InitFcn',...
            'codertarget.parrot.internal.ipSubsystemCallback(gcb);');
        set_param([modelList{k} '/Image Data'],'InitFcn',...
            'codertarget.parrot.internal.inportCallback(gcb);');
        line = find_system(modelList{k},'SearchDepth','1','findall','on','Type','Line', 'Name', 'Y1UY2V');
        portHandle = get_param(line, 'SrcPortHandle');
        sigObj = Simulink.Signal;
        sigObj.CoderInfo.StorageClass = 'ImportedExternPointer';
        sigObj.CoderInfo.Identifier = 'imRGB';            
        set_param(portHandle, 'SignalObject', sigObj);
    end
    
    % Only save if model is not opened, just in case there are unsaved changes
    save_system(modelList{k});

end