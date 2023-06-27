function mass = plotcircles(t)
    theta = 0:0.01:2*pi;
    figure('Name', 'Vibration circles')
    trial = t.P2P(1)*(sin(theta).^2+cos(theta).^2).^0.5;
    polarplot(theta, trial, 'LineWidth', 2)
    hold on
    for i = 2:height(t)
        mass = t.P2P(1).*exp(1j*(deg2rad(t.PhaseMass(i))));
        zmass = mass + t.P2P(i).*exp(1j*theta);
        polarplot(zmass, 'LineWidth', 2)
    end
    hold off
end