function polarvibration(varargin)
% Depict polar plot of vibration in according to mode
% polarvibration(T)
% polarvibration(T, limit)
    global gcolor;
    switch length(varargin)
        case 1
            T = varargin{1};
        case 2
            T = varargin{1};
            limit = varargin{2};
        otherwise
            error('Wrong number of input arguments')
    end

    modes = unique(T.mode); p = [];
    
    % Plot lines of vibration per mode   
    figure('Name', 'Vibration', 'Position', [50 50 1400 700]);     
    for i = 1:length(modes)
        g = colormod(i);
        mode = T(T.mode == modes(i), :);
        cnt = 0;         
        for j = 1:height(mode)
            ref = mode.ref(j);
            if ref ~= -1
                vector = [mode.zP2P(ref); mode.zP2P(j)];
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
        textweighttheta(mode, 'vibration');
    end
    legend(p, cellstr(modes));
    hold off
    
    % Specify limitation of polar plot
    if exist('limit', 'var')
        speclimit(T.tP2P)
    end
    
    saveas(gcf, 'pictures\vibration.png')
end