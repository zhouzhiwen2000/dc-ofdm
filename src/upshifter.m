function s = upshifter(CONST, y, frequencyOffset)
%UPSHIFTER Upshifts signal
arguments(Input)
    CONST
    y (:, 1)
    frequencyOffset double = 0
end
arguments(Output)
    s (:,1)
end
    % "p" equal the oversampling factor
    % It acounts for the error in the carrier frequency produced by the NCO
    %p = CONST.txL / CONST.txM * CONST.ncoUpCarrierFrequency / CONST.ncoUpActualFreq;

    p = CONST.txL;
    n = (0:1:length(y)-1)';
    s = real(y).*cos(pi*n/p + 2*pi*frequencyOffset/CONST.fDAC*n) - ...
        imag(y).*sin(pi*n/p + 2*pi*frequencyOffset/CONST.fDAC*n);
    
    % The OFDM signal rarely goes over 0.5, to use the dinamic range of the
    % DAC, multiply by two.
    s = 2*s;
end

