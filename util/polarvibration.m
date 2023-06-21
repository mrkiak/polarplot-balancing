function T = polarvibration(T,limit,type)
    %% Depict polar plot of vibration in according to mode
    categories = unique(T.Mode);
    list = regexprep(string(categories),'[0-9+-/%.]','');
    color = [];
    figure('Name', 'Vibration');    
    for i=1:length(categories)
        var = T(T.Mode == categories(i), :);
        color = [color; polarfun(var.ComplexVibration, '-', NaN)];
        hold on
        addtext(var, 'vibration');
        T = pullcorrectweight(T,type);
    end
    for i=1:length(categories)
        var = T(T.Mode == categories(i), :);
        arrowpolarplot(var.ComplexVibration, color(i,:));
    end
    legend(list);
    hold off
    if limit == "speclim"
        speclimit(T.PhaseAmplitude)
    else
        thetalim('auto')
    end
end