function [frequencyOffset] = ofdmCFO(P, delay)
%OFDMCFO OFDM Carrier Frequency Offset. Calculate the frequency offset
% between the upshifter and downshifter.
% This method is based on the Cox paper, and assumes that the phase delay
% is less than pi (a phase delay less than "pi", is equal to a frequency
% delay less than "1/T", where "T" is the time duration of the message.
% For IEEE 802.15.13, "T is equal to the first 10 preamble symbols",
% therefore:
% Max delta frequency = 1/T = fsc / 10 = 50M/256 / 10 = 19.5 kHz.
% Considering that, by standard, the oscillators precision is:
% aPhyClockAccuracy = +- 50ppm, and the clock runs at 50MHz:
% Max frequency ofset = 2*100u*50MHz = 10kHz, which is lower than the
% maximum 19.5 kHz.
arguments(Input)
    P (:, 1) double % Output P(d) function from the ofdmSymbolSync.
    delay double
end
arguments(Output)
    frequencyOffset double
end
    constants;
    deltaPhase = angle(P(delay));

    T = preambleFirstPartOFDMSamples/fPHY;

    frequencyOffset = deltaPhase / (pi*T);

end

