function [ofdmSymbols] = channelEstimationGenerate(nullIdx)
%%CHANELESTIMATIONGENERATE Generate the OFDM symbols for the channel 
% estimation.
% The standars says that channel estimation if formed by "2.5 OFDM
% symbols", what this means is that each symbol has a cyclic prefix of
% "N/4", where "N" is the amount of subcarriers.
% Args:
%   - nullIdx = Subcarriers that are masked.
% Output:
%   - ofdmSybols = OFDM Symbols ready to be fed to the OFDM Modulator.
arguments(Input)
    nullIdx (:,1) double
end
arguments(Output)
    ofdmSymbols (:,:) logical
end
    N = 256;    % Total amount of subcarriers
    dataSubcarriers = N - length(nullIdx);
    ofdmSymbols = true(dataSubcarriers, 2);
end