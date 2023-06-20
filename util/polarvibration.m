function T = polarvibration(T,type)
    %% Depict polar plot of vibration in according to mode
    categories = unique(T.Mode);
    list = regexprep(string(categories),'[0-9+-/%.]','');
    color = [];
    figure('Name', 'Vibration');    
    for i=1:length(categories)
        var = T(T.Mode == categories(i), :);
        color = [color; polarfun(var.ComplexVibration)];
        hold on
        addtext(var);
        T = pullcorrectweight(T,type);
    end
    for i=1:length(categories)
        var = T(T.Mode == categories(i), :);
        arrowpolarplot(var.ComplexVibration, color(i,:));
    end
    legend(list);
    hold off
end