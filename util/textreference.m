function T = textreference(T)
% Add text to target weight
    T = T(T.Reference~=-1, :);
    T = T(~isnan(T.CorrectWeight), :);
    theta = T.CorrectPhase; 
    rho = T.CorrectWeight;
    vibration = unique(T.ComplexVibration);
    if length(vibration) == height(T)
        T.Number = (2:height(T)+1)';
    else
        T.Number = repmat(2, height(T), 1);
        cnt = 3;
        for i = 2:height(T)
            if T.ComplexVibration(i) ~= T.ComplexVibration(i-1) 
                T.Number(i) = cnt;
            else
                T.Number(i) = cnt;
                cnt = cnt + 1;
            end      
        end
    end
    text(deg2rad(theta), rho, ...
        [num2str(T.Number,'%i'), ...
        repmat(char(8594), height(T), 1), ...
        num2str(T.Reference,'%i')], ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 8);
end