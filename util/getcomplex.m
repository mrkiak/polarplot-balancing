function z = getcomplex(magnitude, theta)
% Complex double from amplitude and phase
    z = magnitude.*exp(1j*deg2rad(theta));
end