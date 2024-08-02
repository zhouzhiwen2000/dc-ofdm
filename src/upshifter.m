function s = upshifter(y, frequencyOffset)
%UPSHIFTER Upshifts signal
arguments(Input)
    y (:, 1)
    frequencyOffset double = 0
end
arguments(Output)
    s (:,1)
end
    constants;
    n = (0:1:length(y)-1)';
    s = real(y).*cos(pi*n/oversamplingFactor + 2*pi*frequencyOffset/fs*n) - ...
        imag(y).*sin(pi*n/oversamplingFactor + 2*pi*frequencyOffset/fs*n);
end

