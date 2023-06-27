function T = textweighttheta(T, type)
% Add text to vector on polar plot
    if type == "vibration"
        theta = T.PhaseP2P; 
        rho = T.P2P;
        text(deg2rad(theta), rho, ...
            [num2str(T.Weight,'%0.1f'), ...
            repmat('/', height(T), 1), ...
            num2str(T.PhaseWeight,'%-1.0f')], ...
            'HorizontalAlignment', 'left', ...
            'VerticalAlignment', 'bottom', 'FontSize', 8);
    elseif type == "weight"
        T = weightnumber(T);
        theta  = T.PhaseWeight; 
        rho = T.Weight;
        text(deg2rad(theta), rho, ...
            num2str(T.Number-1,'%i'), ...
            'HorizontalAlignment', 'left', ...
            'VerticalAlignment', 'bottom', 'FontSize', 8);
    end
end