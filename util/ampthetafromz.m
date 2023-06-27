function [magnitude, theta] = ampthetafromz(z)
%  Magnitude and phase of complex
    magnitude = abs(z);
    theta = rad2deg(angle(z));
end