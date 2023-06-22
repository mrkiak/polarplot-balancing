function D = addreference(T)
% Increase an initial table size (when rows > 2)  
% by adding reference to each others
    modes = unique(T.Mode);
    D = T(T.Mode == modes(1), :);
    D = head(D, 1);
    for i=1:length(modes)
        mode = T(T.Mode == modes(i), :);
        D = [D; mode(1:2, :)];
        if height(mode) > 2
            for j = 3:height(mode)
                Ad = repelem(mode(j,:), j-1, 1);
                reference = 1:j-1;
                Ad.Reference = reference';
                D = [D; Ad]; 
            end
        end
    end
    D(1, :) = [];
end