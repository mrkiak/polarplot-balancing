function polarvibration(varargin)
% Depict polar plot of vibration in according to mode
% polarvibration(T)
% polarvibration(T, limit)
    switch length(varargin)
        case 1
            T = varargin{1};
        case 2
            T = varargin{1};
            limit = varargin{2};
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
        textweighttheta(mode, 'vibration');
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