function p = polarfun(varargin)
% color = polarfun(complex)
% color = polarfun(complex, linespec)
% color = polarfun(complex, linespec, color)
    switch length(varargin)
        case 1
            complex = varargin{1};
            p = polarplot(complex);
        case 2
            complex = varargin{1};
            linespec = varargin{2};
            p = polarplot(complex, linespec, ...
                'LineWidth', 2);
        case 3
            complex = varargin{1};
            linespec = varargin{2};
            color = varargin{3};
            p = polarplot(complex, linespec, ...
                'LineWidth', 2, ...
                'Color', color);
        otherwise
            error('Too many input arguments')
    end
%    color = p.Color;
end