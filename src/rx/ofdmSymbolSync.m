function [ofdmSynched, delay, M, peaks, P] = ofdmSymbolSync(ofdmIn)
%OFDMSYMBOLSYNC Synchronize OFDM symbols using the Cox and Schmidl method.
% Returns the ofdm signal with the delay and preamble removed.
% Note: "M" function from the Cox paper and "S" function from the peak
% detection function are almost the same. Therefore, simply "M" is used.
arguments(Input)
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmSynched (:,1) double
    delay double
    M (:,1) double
    peaks (:,1) double
    P (:, 1)
end
    constants;

    % For the symbol, we will use the first ten repetitions of the OFDM
    % preamble
    L = preambleFirstPartOFDMSamples/2; % Length of the training symbol (half of the ten preamble symbols)
    M = zeros(length(ofdmIn), 1);
    P = zeros(length(ofdmIn), 1);

    for d=1:1:length(ofdmIn)-2*L
        firstSymbol = ofdmIn(d+1:d+L);
        secondSymbol = ofdmIn(d+L+1:d+2*L);
        bothSymbols = [firstSymbol; secondSymbol];
    
        P(d) = sum(firstSymbol.*conj(secondSymbol));
        Rf = 1/2 * sum((abs(bothSymbols)).^2);
    
        M(d) = abs(P(d))^2 / Rf^2;
    end

    % Same as searching for the "max" of the function "M"
    %[~, delay] = max(M);
    peaks = rawPeakDetection(M, peakDetectorWindow, peakDetectorThreshold);
    if (~isempty(peaks))
        delay = peaks(1);
    else
        delay = 0;
    end

    ofdmSynched = ofdmIn(1+delay+preambleOFDMSamples:end);
end

