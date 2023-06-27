function T = weightreal(T)
    modes = unique(T.mode);
    for i = 1:length(modes)
        mode = T(T.mode == modes(i), :);
        for j = 1:height(mode)
            el = T(j,:); 
            zWeight = el.zWeight;
            ref = el.ref;
            while ref ~= -1
                el = T(ref,:);
                zWeight = zWeight + el.zWeight;
                ref = el.ref;
            end
            T.zWeightReal(j) = zWeight;
        end
    end
end