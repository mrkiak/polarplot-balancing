function [weight, theta, weightcomplex] = w_t_isakovich(a1, a2, m1, m2)
% Algorithm of Isakovich, Perchanok "Ustranenie vibracii 
% elektricheskih machine", page 154. Two weights have to 
% be uninstalled. Target weight is unbalanced weight 
    a = a2 - a1;
    m = m2 - m1;
    k = a/m;
    weightcomplex = -m*a1/a + m1;
    weight = round(abs(weightcomplex),1);
    theta = round(rad2deg(wrapToPi(angle(weightcomplex))),0);
    %fprintf(['Correcting weight = %0.2f/%0.0f' char(176) '\n'], ...
    %    weight_necessaty, ...
    %    angle_necessaty);
end