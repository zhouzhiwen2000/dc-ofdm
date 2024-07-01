function [s] = downshifter(y)
%DOWNSHIFTER Inverse operation to upshifter.
% TODO: edge problem (initial values of the FIR filter).
    constants;
    n = (0:1:length(y)-1)';

    s_real = 2*y.*cos(pi*n/oversamplingFactor);
    s_imag = -2*y.*sin(pi*n/oversamplingFactor);

    s_real = [s_real; repmat(s_real(end), lpfDelay*2, 1)];
    s_imag = [s_imag; repmat(s_imag(end), lpfDelay*2, 1)];

    s_real = lpfFilter(s_real);
    s_imag = lpfFilter(s_imag);

    % Remove delay from FIR filter
    s_real(1:lpfDelay) = [];
    s_real(end-lpfDelay+1:end) = [];

    s_imag(1:lpfDelay) = [];
    s_imag(end-lpfDelay+1:end) = [];

    s = s_real + 1i*s_imag;
end

