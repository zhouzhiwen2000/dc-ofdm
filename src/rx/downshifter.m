function [s] = downshifter(y, frequencyOffset)
%DOWNSHIFTER Inverse operation to upshifter.
arguments(Input)
    y (:, 1)
    frequencyOffset double = 0
end
arguments(Output)
    s (:,1)
end
    constants;
    n = (0:1:length(y)-1)';

    s_real = 2*y.*cos(pi*n/oversamplingFactor + 2*pi*frequencyOffset/fs*n);
    s_imag = -2*y.*sin(pi*n/oversamplingFactor + 2*pi*frequencyOffset/fs*n);

    s = s_real + 1i*s_imag;
end

