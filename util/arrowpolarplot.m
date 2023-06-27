function arrowpolarplot(z, color)
% Add arrows to polar plot
     if (length(z) > 1)
         for i=2:length(z)
             delta = z(i-1)-z(i);
             resultant_length = abs(z(i));
             resultant_direction = angle(z(i));
             arrowhead_length = abs(delta)^0.4; 
             num_arrowlines = 30;
             arrowhead_angle = deg2rad(30);
             t1 = repmat(resultant_direction,1,num_arrowlines);
             r1 = repmat(resultant_length,1,num_arrowlines);
             theta_prepare = linspace(angle(delta)-arrowhead_angle/2, ...
             angle(delta)+arrowhead_angle/2, num_arrowlines);          
             part_arraw = z(i) + arrowhead_length*exp(1j*theta_prepare);
             polarplot([t1; angle(part_arraw)],[r1; abs(part_arraw)], ...
                 'Color', color)
         end
     end
end