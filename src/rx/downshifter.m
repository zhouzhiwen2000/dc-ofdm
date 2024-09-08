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
    
    p = rxM/rxL;
    n = (0:1:length(y)-1)';

    s_real = 2*y.*cos(pi*n/p + 2*pi*frequencyOffset/fADC*n);
    s_imag = -2*y.*sin(pi*n/p + 2*pi*frequencyOffset/fADC*n);

    s = s_real + 1i*s_imag;
end

