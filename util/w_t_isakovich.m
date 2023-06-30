function [mWeight, tWeight, zWeight, mSen, tSen] ...
    = w_t_isakovich(a1, a2, m1, m2)
% Algorithm of Isakovich, Perchanok "Ustranenie vibracii 
% elektricheskih machine", page 154. Two weights have to 
% be uninstalled. Target weight is unbalanced weight 
    a = a2 - a1;
    m = m2 - m1;
    k = a/m;
    [mSen, tSen] = ampthetafromz(k);
    zWeight = -m*a1/a + m1;
    mWeight = round(abs(zWeight),1);
    tWeight = round(rad2deg(wrapToPi(angle(zWeight))),0);
end
