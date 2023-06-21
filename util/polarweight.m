function polarweight(T,limit,type)
    %% Depict polar plot of weights in according to mode
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
        color = [color; polarfun(mode.ComplexWeight, '-', NaN)];
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
    if limit == "speclim"
        speclimit([T.PhaseWeight; D.CorrectPhase])
    else
        thetalim('auto')
    end
end