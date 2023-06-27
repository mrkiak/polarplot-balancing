function T = pullcorrectweight(varargin)
% Calculate target weight by different algorithms
% T = polarvibration(T)
% T = polarvibration(T, type)
% 'cad'  — mathCAD code and it is bad choice; 
% 'ref'  — algorithm from Isakovich book. It is default algorithm;
% 'all'  — like previous but for all runs in an mode.
    switch length(varargin)
        case 1
            T = varargin{1};
            type = "ref";
        case 2
            T = varargin{1};
            type = varargin{2};
        otherwise
            error('Wrong number of input arguments')
    end
    
    if type == "all" || type == "ref"
        T = validreference(T);
        if type == "all"
            T = addreference(T);
            type = "ref";
        end
    end
    
    modes = unique(T.mode);
    for i=1:length(modes)
        onemode = T(T.mode == modes(i), :);
        for j = 1:height(T)
            if type == "cad" && T.mode(j) == modes(i) && T.mWeight(j) ~= 0 
                    [T.mWeightTarget(j), T.tWeightTarget(j)] = ...
                        w_t_mathcad(onemode.zP2P(1), ...
                        T.zP2P(j), ...
                        T.mWeight(j));
                    T.zWeightTarget(j) = getcomplex(T.mWeightTarget(j), ...
                        T.tWeightTarget(j));
            elseif type == "ref" && T.mode(j) == modes(i) && T.ref(j) ~= -1
                    ref = T.ref(j);
                    [T.mWeightTarget(j), T.tWeightTarget(j), ...
                        T.zWeightTarget(j), ...
                        T.mSen(j), T.tSen(j)] = ...
                        w_t_isakovich(onemode.zP2P(ref), T.zP2P(j), ...
                        onemode.zWeight(ref), T.zWeight(j));
            end
        end
    end
end