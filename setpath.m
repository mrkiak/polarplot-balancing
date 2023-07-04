function setpath
    %% Add paths "\util", "\data"
    addpath(fullfile(pwd, '\util')); 
    addpath(fullfile(pwd, '\data'));
    addpath(fullfile(pwd, '\util\validation'));
    addpath(fullfile(pwd, '\util\app'));
    globalcolor;
end