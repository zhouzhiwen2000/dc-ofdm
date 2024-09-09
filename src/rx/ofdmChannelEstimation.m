function [ofdmOut, channelEst] = ofdmChannelEstimation(CONST, ofdmIn)
%OFDMCHANNELESTIMATION Estimates channel using reference symbols. The input
% data is taken after the OFDM demodulator, and does and average of the two
% OFDM symbols that form the channel estimation.
% Returns the ofdm signal with the channel estimation symbols removed.
arguments(Input)
    CONST
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmOut (:,1) double
    channelEst (:,1) double
end
    ofdmChannel = ofdmIn(1:CONST.channelOFDMSamples);

    qamSignalScrambled = ofdmdemod(ofdmChannel, CONST.N, ...
        CONST.channelCyclicPrefixLen, 0, CONST.nullIdx);

    qamSignal = zeros(size(qamSignalScrambled));
     for i=1:1:width(qamSignalScrambled)
        qamSignal(:,i) = constellationScrambler(qamSignalScrambled(:,i), ...
            CONST.channelScramblerInit, true);
     end

    channelEst = (qamSignal(:,1) + qamSignal(:,2)) .* conj(CONST.channelEstReference) / 2;
    ofdmOut = ofdmIn(1+CONST.channelOFDMSamples:end);
end