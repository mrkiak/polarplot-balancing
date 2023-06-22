function speclimit(T)
% Return correct theta limits for polar plot
    T = T(T ~= 0);
    D = T;
    h = length(D);
    minvalue = NaN; maxvalue = NaN;
    if h > 1
        for i = 1:h
            if T(i) < 0
                D(i) = 360+T(i);
            end                
        end
        for angle = 0:10:350
            if sum(D < angle) > 0 
                minvalue = angle-15;             
                break
            end
        end
        for angle = 350:-10:0
            if sum(D > angle) > 0
                maxvalue = angle+15;
                break
            end
        end  
    end
    if ~(isnan(minvalue) || isnan(maxvalue))
        if abs(maxvalue-minvalue)>180
            minvalue = min(T)-15;
            maxvalue = max(T)+15;
            thetalim([minvalue maxvalue])
        else  
            thetalim([minvalue maxvalue])
        end
    else
        thetalim('auto')
    end
end