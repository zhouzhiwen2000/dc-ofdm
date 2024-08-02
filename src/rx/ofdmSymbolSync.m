function [ofdmSynched, delay, M, peaks, P] = ofdmSymbolSync(ofdmIn)
%OFDMSYMBOLSYNC Synchronize OFDM symbols using the Cox and Schmidl method
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
    L = (N + preambleCyclicPrefixLen)*5;    % Length of the training symbol (half of the ten preamble symbols)
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

    % Nota: parece que las funciones "M" del paper de Cox y "S" del paper 
    % de peak detection son casi iguales. Por lo que se usa directamente
    % "M" para detectar el pico
    %[~, delay] = max(M);
    peaks = rawPeakDetection(M, peakDetectorWindow, peakDetectorThreshold);
    if (~isempty(peaks))
        delay = peaks(1);
    else
        delay = 0;
    end
    ofdmSynched = ofdmIn(delay+1:end);
end

