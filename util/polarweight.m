function polarweight(T,limit,type)
    %% Depict polar plot of weights in according to mode
    categories = unique(T.Mode);
    list = regexprep(string(categories),'[0-9+-/%.]','');
    color = [];
    figure('Name', 'Weight');    
    if type == "ref"
        D = pullcorrectweight(T,type);
    elseif type == "all"
        D = pullcorrectweight(T,type);
    end   
    for i=1:length(categories)
        onemode = T(T.Mode == categories(i), :);
        color = [color; polarfun(onemode.ComplexWeight, '-', NaN)];
        addtext(onemode, 'weight');
        hold on

    end
    for i=1:length(categories)
        onemode = D(D.Mode == categories(i), :);
        polarfun(onemode.ComplexCorrectWeight, 'o', color(i,:));
    end
    for i=1:length(categories)
        onemode = T(T.Mode == categories(i), :);
        arrowpolarplot(onemode.ComplexWeight, color(i,:));
    end 
   
    legend(list);
    hold off
    if limit == "speclim"
        speclimit(T.PhaseWeight)
    else
        thetalim('auto')
    end
end