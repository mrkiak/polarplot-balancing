function T = polarvibration(varargin)
% Depict polar plot of vibration in according to mode
% T = polarvibration(T, type)
% T = polarvibration(T, limit, type)
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
    figure('Name', 'Vibration'); 
    
    % Plot lines of vibration 
    for i = 1:length(modes)
        mode = T(T.Mode == modes(i), :);
        color = [color; polarfun(mode.ComplexVibration, '-')];
        hold on
        addtext(mode, 'vibration');
        T = pullcorrectweight(T, type);
    end
    
    % Plot arrows of lines
    for i = 1:length(modes)
        mode = T(T.Mode == modes(i), :);
        arrowpolarplot(mode.ComplexVibration, color(i,:));
    end
    legend(modes);
    hold off
    
    % Specify limitation of polar plot
    if exist('limit', 'var')
        speclimit(T.PhaseAmplitude)
    end
end