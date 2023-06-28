function D = sumsen(T)
    modes = unique(T.mode); 
    D = table(modes, zeros(length(modes),1), zeros(length(modes),1));
    D.Properties.VariableNames = {'modes','mSen','tSen'};
    for i = 1:length(modes)
        mode = T(T.mode == modes(i), :);
        tf = (mode.use == 1);        
        D.mSen(i) = mean(mode.mSen(tf));
        D.tSen(i) = mean(mode.tSen(tf)); 
    end
end