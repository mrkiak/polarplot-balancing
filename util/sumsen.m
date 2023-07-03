function D = sumsen(T)
% Return summary table with: modes, mSen, tSen, zP2P, zWeight
% The number of rows equals the number of modes 
    modes = unique(T.mode); 
    varTypes = [{'categorical'}, repmat({'double'},1,8)];
    varNames = {'modes', 'mSen', 'tSen', 'mP2P', 'tP2P', ...
        'mWeight', 'tWeight', 'mWeightTarget', 'tWeightTarget'};
    sz = [length(modes) 9];
    D = table('Size', sz, ...
        'VariableTypes', varTypes, ...
        'VariableNames', varNames);
    D.modes = modes;
    for i = 1:length(modes)
        mode = T(T.mode == modes(i), :);
        tf = (mode.use == 1);        
        D.mSen(i) = mean(mode.mSen(tf));
        D.tSen(i) = mean(mode.tSen(tf)); 
        D.mP2P(i) = mode.mP2P(mode.mWeight == 0);
        D.tP2P(i) = mode.tP2P(mode.mWeight == 0);
        D.mWeight(i) = mode.mWeight(mode.mWeight == 0);
        D.tWeight(i) = mode.tWeight(mode.mWeight == 0);
    end
    [mWeightTarget, tWeightTarget] = minvibration(D);
    D.mWeightTarget = repmat(mWeightTarget, length(modes), 1); 
    D.tWeightTarget = repmat(tWeightTarget, length(modes), 1); 
 end