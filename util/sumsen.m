function D = sumsen(T)
    modes = unique(T.mode); 
    D = table(modes, zeros(length(modes),1), ...
        zeros(length(modes),1), zeros(length(modes),1));
    D.Properties.VariableNames = {'modes','mSen','tSen','zP2P'};
    for i = 1:length(modes)
        mode = T(T.mode == modes(i), :);
        tf = (mode.use == 1);        
        D.mSen(i) = mean(mode.mSen(tf));
        D.tSen(i) = mean(mode.tSen(tf)); 
        D.zP2P(i) = mode.zP2P(mode.mWeight == 0);
        D.zWeight(i) = mode.zWeight(mode.mWeight == 0);
    end
 end