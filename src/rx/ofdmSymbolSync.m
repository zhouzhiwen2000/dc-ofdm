function [ofdmSynched, delay, M] = ofdmSymbolSync(ofdmIn)
%OFDMSYMBOLSYNC Synchronize OFDM symbols using the Cox and Schmidl method
arguments(Input)
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmSynched (:,1) double
    delay double
    M (:,1) double
end
    constants;

    % For the symbol, we will use the first ten repetitions of the OFDM
    % preamble
    L = (N + preambleCyclicPrefixLen)*5;    % Length of the training symbol (half of the ten preamble symbols)
    M = zeros(length(ofdmIn), 1);

    for d=1:1:length(ofdmIn)-2*L
        firstSymbol = ofdmIn(d+1:d+L);
        secondSymbol = ofdmIn(d+L+1:d+2*L);
        bothSymbols = [firstSymbol; secondSymbol];
    
        P = sum(firstSymbol.*conj(secondSymbol));
        Rf = 1/2 * sum((abs(bothSymbols)).^2);
    
        M(d) = abs(P)^2 / Rf^2;
    end
    [~, delay] = max(M);

    ofdmSynched = ofdmIn(delay+1:end);
end

