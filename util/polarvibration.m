function T = polarvibration(T, limit, type)
    %% Depict polar plot of vibration in according to mode
    modes = unique(T.Mode);
    color = [];
    figure('Name', 'Vibration'); 
    
    % Plot lines of vibration 
    for i = 1:length(modes)
        mode = T(T.Mode == modes(i), :);
        color = [color; polarfun(mode.ComplexVibration, '-', NaN)];
        hold on
        addtext(mode, 'vibration');
        T = pullcorrectweight(T, type);
    end
    
    % Plot arrows of lines
    for i = 1:length(modes)
        mode = T(T.Mode == modes(i), :);
        arrowpolarplot(mode.ComplexVibration, color(i,:));
    end
    legend(modes(modes));
    hold off
    
    % Specify limitation of polar plot
    if limit == "speclim"
        speclimit(T.PhaseAmplitude)
    else
        thetalim('auto')
    end
end