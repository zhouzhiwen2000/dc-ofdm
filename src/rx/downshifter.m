function [s] = downshifter(y)
%DOWNSHIFTER Inverse operation to upshifter.
    constants;
    n = (0:1:length(y)-1)';

    s_real = 2*y.*cos(pi*n/oversamplingFactor);
    s_imag = -2*y.*sin(pi*n/oversamplingFactor);

    s = s_real + 1i*s_imag;
end

