function color = polarfun(complex, linespec, color)
    if isnan(color) 
        p = polarplot(complex, linespec, ...
            'LineWidth', 2);
    else 
        p = polarplot(complex, linespec, ...
            'LineWidth', 2, ... 
            'Color', color);
    end
    color = p.Color;
end