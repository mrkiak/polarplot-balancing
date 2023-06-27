function T = weightnumber(T)
    T = T(T.Reference~=-1, :);
    T = T(~isnan(T.Weight), :);
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
end