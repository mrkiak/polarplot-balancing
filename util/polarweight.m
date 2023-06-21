function polarweight(varargin)
% Depict polar plot of weights in according to mode
% T = polarweight(T, type)
% T = polarweight(T, limit, type)
    switch length(varargin)
        case 2
            T = varargin{1};
            type = varargin{2};
        case 3
            T = varargin{1};
            limit = varargin{2};
            type = varargin{3};
        otherwise
            error('Wrong number of input arguments')
    end
    
    modes = unique(T.Mode);
    color = [];
    figure('Name', 'Weight');    
    if type == "ref"
        D = pullcorrectweight(T,type);
    elseif type == "all"
        D = pullcorrectweight(T,type);
    end   
    
    % Plot lines of weight   
    for i=1:length(modes)
        mode = T(T.Mode == modes(i), :);
        color = [color; polarfun(mode.ComplexWeight, '-')];
        addtext(mode, 'weight');
        hold on
    end
    
    % Plot dots of target weight    
    for i=1:length(modes)
        mode = D(D.Mode == modes(i), :);
        polarfun(mode.ComplexCorrectWeight, 'o', color(i,:));
    end
    
    % Plot arrows of lines    
    for i=1:length(modes)
        mode = T(T.Mode == modes(i), :);
        arrowpolarplot(mode.ComplexWeight, color(i,:));
    end
    legend(modes(modes));
    hold off
    
    % Specify limitation of polar plot
    if exist('limit', 'var')
        speclimit([T.PhaseWeight; D.CorrectPhase])
    end
end