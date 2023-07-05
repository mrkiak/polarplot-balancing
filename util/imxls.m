function data = imxls(xlsfile)
    [path, name, ext] = fileparts(xlsfile);
    if ~(ext == ".xls" ||  ext == ".xlsm")
        fprintf(2, 'Selected file is not excel file. Try to find\n');
        xlsfile = [path, name, '.xls'];
    end    
    
    % Import the data
    opts = detectImportOptions(fullfile(xlsfile));
    opts.VariableTypes = ["categorical", repelem("double", 6)];
    data = readtable(fullfile(xlsfile), opts); 
    data.Properties.VariableNames = ["mode", "mP2P", "tP2P", ...
        "mWeight", "tWeight", "ref", "use"];
    
    % Add complex values of vibration and weight
    data.zP2P = getcomplex(data.mP2P, data.tP2P);
    data.zWeight = getcomplex(data.mWeight, data.tWeight);
    data = weightsum(data);
    
    % datesvct = NaN(size(data,1), 1); 
    % Validation data
    %data = validreference(data);
    %data = validusefulness(data);
end