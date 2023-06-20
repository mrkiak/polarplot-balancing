function [weight_necessaty, angle_necessaty] = m_a_isakovich(a1, a2, m1, m2)
    %% Algorithm of Isakovich, Perchanok "Ustranenie vibracii 
    % elektricheskih machine", page 154.
    a = a2 - a1;
    m = m2 - m1;
    k = a/m;
    m_necessaty = -m*a1/a + m1;
    weight_necessaty = round(abs(m_necessaty),1);
    angle_necessaty = round(rad2deg(wrapToPi(angle(m_necessaty))),0);
    %fprintf(['Correcting weight = %0.2f/%0.0f' char(176) '\n'], ...
    %    weight_necessaty, ...
    %    angle_necessaty);
end