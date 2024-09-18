function [s] = downshifter(CONST, y, frequencyOffset)
%DOWNSHIFTER Inverse operation to upshifter.
arguments(Input)
    CONST
    y (:, 1)
    frequencyOffset double = 0
end
arguments(Output)
    s (:,1)
end    
    %p = CONST.rxM / CONST.rxL;

    p = CONST.rxM;
    n = (0:1:length(y)-1)';

    s_real = y.*cos(pi*n/p + 2*pi*frequencyOffset/CONST.fADC*n);
    s_imag = -y.*sin(pi*n/p + 2*pi*frequencyOffset/CONST.fADC*n);

    s = s_real + 1i*s_imag;
end

