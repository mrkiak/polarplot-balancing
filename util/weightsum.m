function D = weightsum(T)
    modes = unique(T.mode);
    box = -1;
    for i = 1:length(modes)
        mode = T(T.mode == modes(i), :);
        for j = 1:height(mode)
            row = mode(j,:); 
            pull = row.zWeight;
            ref = row.ref;
            while ref ~= -1
                row = mode(ref,:);
                pull = [pull; row.zWeight];
                ref = row.ref;
            end
            if length(pull) > 1
                [magnitude, theta] = ampthetafromz(pull);
                for k = length(pull)-1:-1:1
                    theta(k) = theta(k) + theta(k+1);
                end
                pull = getcomplex(magnitude, theta);
                mode.zWeightSum(j) = sum(pull);
            else
                mode.zWeightSum(j) = pull;
            end
        end
        if box == -1
            D = mode;
            box = 1;
        else
            D = [D; mode];
        end
    end
end