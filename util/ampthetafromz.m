function [amplitude, theta] = ampthetafromz(z)
% Amplitude and phase of complex
    amplitude = abs(z);
    theta = rad2deg(angle(z));
end