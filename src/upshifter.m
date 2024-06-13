function s = upshifter(y)
%UPSHIFTER Upshifts signal
    constants;
    n = (0:1:length(y)-1)';
    s = real(y).*cos(pi*n/oversamplingFactor) - imag(y).*sin(pi*n/oversamplingFactor);
end

