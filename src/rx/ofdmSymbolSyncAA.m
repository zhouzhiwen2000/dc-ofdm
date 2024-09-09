%% UNUSED
function [ofdmSynched, delay, M] = ofdmSymbolSyncAA(CONST, ofdmIn)
%OFDMSYMBOLSYNC Synchronize OFDM symbols using the Min A A -A -A method.
arguments(Input)
    CONST
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmSynched (:,1) double
    delay double
    M (:,1) double
end
    % For the symbol, we will use the first ten repetitions of the OFDM
    % preamble
    L = (CONST.N + CONST.preambleCyclicPrefixLen);    % Length of the training symbol
    M = zeros(length(ofdmIn), 1);

    for d=1:1:length(ofdmIn)-4*L
        P = sum(conj(ofdmIn(d+1:d+L)) .* ofdmIn(d+1+L:d+2*L)) + ...
            sum(conj(ofdmIn(d+2*L+1:d+2*L+L)) .* ofdmIn(d+1+L+2*L:d+2*L+2*L));

        Rf = sum((abs(ofdmIn(d+L+1:d+2*L))).^2) + sum((abs(ofdmIn(d+L+2*L+1:d+2*L+2*L))).^2);
    
        M(d) = abs(P)^2 / Rf^2;
    end

    [~, delay] = max(M);
    ofdmSynched = ofdmIn(delay+1:end);
end

