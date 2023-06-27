function textreference(T)
% Add text to target weight
    T = T(T.ref~=-1, :);
    T = T(~isnan(T.mWeightTarget), :);
    theta = T.tWeightTarget; 
    rho = T.mWeightTarget;
    vibration = unique(T.zP2P);
    if length(vibration) == height(T)
        T.number = (2:height(T)+1)';
    else
        T.number = repmat(2, height(T), 1);
        cnt = 3;
        for i = 2:height(T)
            if T.zP2P(i) ~= T.zP2P(i-1) 
                T.number(i) = cnt;
            else
                T.number(i) = cnt;
                cnt = cnt + 1;
            end      
        end
    end
    text(deg2rad(theta), rho, ...
        [num2str(T.number-1,'%i'), ...
        repmat(char(8594), height(T), 1), ...
        num2str(T.ref-1,'%i')], ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 8);
end