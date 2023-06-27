function D = polarweight(varargin)
% Depict polar plot of weights in according to mode
% T = polarweight(T, type)
% T = polarweight(T, limit, type)
    global gcolor;
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
    
    D = pullcorrectweight(T, type);
    modes = unique(T.Mode); p = [];   
    
    % Plot lines of weight per mode      
    figure('Name', 'Weights', 'Position', [50 50 1400 700]);
    for i = 1:length(modes)
        g = colormod(i);
        mode = T(T.Mode == modes(i), :);
        cnt = 0;         
        for j = 1:height(mode)
            ref = mode.Reference(j);
            if ref ~= -1
                vector = [mode.ComplexWeight(ref); ...
                    mode.ComplexWeight(j)];
                if cnt == 0 
                    p = [p, polarfun(vector, '-', gcolor(g,:))];
                    cnt = cnt + 1;
                else
                    polarfun(vector, '-', gcolor(g,:));
                end
                hold on          
                arrowpolarplot(vector, gcolor(g,:));
            end
        end
        textweighttheta(mode, 'weight');
    end
    
    % Plot dots of target weight    
    for i=1:length(modes)
        mode = D(D.Mode == modes(i), :);
        g = colormod(i);
        polarfun(mode.ComplexCorrectWeight, 'o', gcolor(g,:));
        textreference(mode);
    end
    legend(p, cellstr(modes));
    hold off
    
    % Specify limitation of polar plot
    if exist('limit', 'var')
        speclimit([T.PhaseWeight; D.CorrectPhase])
    end
    
    saveas(gcf, 'pictures\weights.png')

end