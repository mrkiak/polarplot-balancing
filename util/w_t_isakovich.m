function [weight, theta, weightcomplex, kvalue, kphase] ...
    = w_t_isakovich(a1, a2, m1, m2)
% Algorithm of Isakovich, Perchanok "Ustranenie vibracii 
% elektricheskih machine", page 154. Two weights have to 
% be uninstalled. Target weight is unbalanced weight 
    a = a2 - a1;
    m = m2 - m1;
    k = a/m;
    [kvalue, kphase] = ampthetafromz(k);
    weightcomplex = -m*a1/a + m1;
    weight = round(abs(weightcomplex),1);
    theta = round(rad2deg(wrapToPi(angle(weightcomplex))),0);
end
