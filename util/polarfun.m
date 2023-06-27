function p = polarfun(varargin)
% color = polarfun(complex)
% color = polarfun(complex, linespec)
% color = polarfun(complex, linespec, color)
    switch length(varargin)
        case 1
            z = varargin{1};
            p = polarplot(z);
        case 2
            z = varargin{1};
            linespec = varargin{2};
            p = polarplot(z, linespec, ...
                'LineWidth', 2);
        case 3
            z = varargin{1};
            linespec = varargin{2};
            color = varargin{3};
            p = polarplot(z, linespec, ...
                'LineWidth', 2, ...
                'Color', color);
        otherwise
            error('Too many input arguments')
    end
end