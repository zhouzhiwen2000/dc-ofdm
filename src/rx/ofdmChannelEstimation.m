function [ofdmOut, channelEst] = ofdmChannelEstimation(ofdmIn)
%OFDMCHANNELESTIMATION Estimates channel using reference symbols. The input
% data is taken after the OFDM demodulator, and does and average of the two
% OFDM symbols that form the channel estimation.
% Returns the ofdm signal with the channel estimation symbols removed.
arguments(Input)
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmOut (:,1) double
    channelEst (:,1) double
 end
    constants;

    ofdmChannel = ofdmIn(1:channelOFDMSamples);

    qamSignalScrambled = ofdmdemod(ofdmChannel, N, channelCyclicPrefixLen, 0, nullIdx);

    qamSignal = zeros(size(qamSignalScrambled));
     for i=1:1:width(qamSignalScrambled)
        qamSignal(:,i) = constellationScrambler(qamSignalScrambled(:,i), channelScramblerInit, true);
     end

    channelEst = (qamSignal(:,1) + qamSignal(:,2)) .* conj(channelEstRefence) / 2;
    ofdmOut = ofdmIn(1+channelOFDMSamples:end);
end