function points = arrowapp(zP2P, a)
% Add arrows to polar plot
    z = zP2P - a;
    resultant_length = abs(a);
    resultant_direction = angle(a);
    arrowhead_length = abs(z)/10; 
    num_arrowlines = 30;
    num_points = 100;
    arrowhead_angle = deg2rad(30);
    t1 = repmat(resultant_direction,1,num_arrowlines);
    r1 = repmat(resultant_length,1,num_arrowlines);
    theta_prepare = linspace(angle(z)-arrowhead_angle/2, ...
    angle(z)+arrowhead_angle/2, num_arrowlines);          
    part_arraw = a + arrowhead_length*exp(1j*theta_prepare);
    z1 = getcomplex(r1, rad2deg(t1));
    z2 = getcomplex(abs(part_arraw), rad2deg(angle(part_arraw)));
    points = zeros(num_arrowlines,num_points);
    for i = 1:num_arrowlines
        points(i,:) = linspace(z1(i), z2(i), num_points);
    end    
    points = reshape(points, [1, num_arrowlines*num_points]);
end