function T = weightnumber(T)
    T = T(T.ref~=-1,:);
    T = T(~isnan(T.mWeight),:);
    vibration = unique(T.zP2P);
    if length(vibration) == height(T)
        T.number = (2:height(T)+1)';
    else
        T.number = repmat(2,height(T),1);
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
end