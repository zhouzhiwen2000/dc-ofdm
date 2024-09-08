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
    % "p" equal the oversampling factor
    % It acounts for the error in the carrier frequency produced by the NCO
    p = txL/txM*ncoUpCarrierFrequency/ncoUpActualFreq;
    n = (0:1:length(y)-1)';
    s = real(y).*cos(pi*n/p + 2*pi*frequencyOffset/fDAC*n) - ...
        imag(y).*sin(pi*n/p + 2*pi*frequencyOffset/fDAC*n);
end

