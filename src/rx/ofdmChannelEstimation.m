function [channelEst] = ofdmChannelEstimation(dataIn)
%OFDMCHANNELESTIMATION Estimates channel using reference symbols. The input
% data is taken after the OFDM demodulator, and does and average of the two
% OFDM symbols that form the channel estimation.
    constants;

    qamSignalScrambled = ofdmdemod(dataIn, N, channelCyclicPrefixLen, 0, nullIdx);

    qamSignal = zeros(size(qamSignalScrambled));
     for i=1:1:width(qamSignalScrambled)
        qamSignal(:,i) = constellationScrambler(qamSignalScrambled(:,i), channelScramblerInit, true);
     end

    channelEst = (qamSignal(:,1) + qamSignal(:,2)) .* conj(channelEstRefence) / 2;
end