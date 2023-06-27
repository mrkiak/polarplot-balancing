function data = imdata(csvfile)
    % Setup the Import Options and import the data
    opts = delimitedTextImportOptions("NumVariables", 5);

    % Specify range and delimiter
    opts.DataLines = [2, Inf];
    opts.Delimiter = ";";

    % Specify column names and types
    opts.VariableNames = ["Mode", ...
        "P2P", "PhaseP2P", ...
        "Weight", "PhaseWeight", ...
        "Reference", "Use" ...
        "ComplexVibration", ...
        "ComplexWeight", ...
        "SensitivityValue", "SensitivityPhase", ...
        "CorrectWeight", "CorrectPhase", "ComplexCorrectWeight"];
    opts.VariableTypes = ["categorical", ...
        repelem("double", 4), ...
        repelem("int16", 2), ...
        repelem("double", 7)];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    
    % Specify variable properties
    opts = setvaropts(opts, "Mode", "EmptyFieldRule", "auto");
    opts = setvaropts(opts, ["P2P", "PhaseP2P", ...
        "Weight", "PhaseWeight"], "DecimalSeparator", ",");
    
    % Import the data
    data = readtable(fullfile(csvfile), opts); 
    data = movevars(data, 'ComplexVibration', 'After', 'PhaseP2P');
    data = movevars(data, 'ComplexWeight', 'After', 'PhaseWeight');
    
    % Add complex values of vibration and weight
    data.ComplexVibration = getcomplex(data.P2P, data.PhaseP2P);
    data.ComplexWeight = getcomplex(data.Weight, data.PhaseWeight);
end