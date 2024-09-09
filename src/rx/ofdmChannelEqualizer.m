function [dataOut] = ofdmChannelEqualizer(dataIn, channelEst)
%OFDMCHANNELEQUALIZER Equalize channel, returning the samples unaffected by
% the channel response given in the "channelESt" parameter.
    dataOut = dataIn .* conj(channelEst) ./ abs(channelEst).^2;
end

