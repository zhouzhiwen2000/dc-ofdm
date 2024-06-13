function s = ofdmModulate(dataIn, bitsPerSubcarrier, cpLen, nullIdx, constellationScramblerInit)
%OFDMMODULATE Modulate the input data. This functions makes the following
% things:
%   - Takes the binary symbols, and does constellation mapping of order M.
%   - Applies the constellation scrambler to the previous points.
%   - Produces the OFDM signal, with cyclic prefix and oversampling.
%   - Makes the frequency upshift of the signal.
arguments(Input)
    dataIn (:,:) uint8
    bitsPerSubcarrier double
    cpLen double
    nullIdx (:,1) double
    constellationScramblerInit (1,13) uint8
end
arguments(Output)
    s (:,:) double
end

    %% Parameters
    constants;
    ofdmSymbolLength = (N+cpLen)*oversamplingFactor; % Length of each OFDM symbol in samples
    nSym = width(dataIn);           % Amount of OFDM symbols present in the current data.
    s = zeros(ofdmSymbolLength, width(dataIn));

    %% Transmit each OFDM Symbol
    for i=1:1:nSym
        qamSignal = qammod(dataIn(:,i), 2^bitsPerSubcarrier, UnitAveragePower=true, PlotConstellation=false, InputType='bit');
        qamSignalScrambled = constellationScrambler(qamSignal, constellationScramblerInit);
        y(:,i) = ofdmmod(qamSignalScrambled, N, cpLen, nullIdx, OversamplingFactor=1);
    end
    s = y(:);
end

