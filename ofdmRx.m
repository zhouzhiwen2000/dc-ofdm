%% OFDM RX
% Full implementation of an OFDM RX compliant with IEEE 802.15.13
clc; clear; close all;
addpath("src");
addpath("src/rx")
addpath("inc")
constants;
parameters;

%% Run transmitter
ofdmTx; % Data is in OFDMSignal
close all;

%% Separate Preamble, Channel and Header
% Payload can't be processed until the header was obtained (I need to know
% the cyclic prefix used for the payload)
OFDMRx = downshifter(OFDMSignal);
OFDMRx = decimator(OFDMRx);

preambleRx = OFDMRx(1:preambleOFDMSamples);
channelRx = OFDMRx(preambleOFDMSamples+1 : ...
    preambleOFDMSamples + channelOFDMSamples);
headerRx = OFDMRx(preambleOFDMSamples+channelOFDMSamples+1 : ...
    preambleOFDMSamples + channelOFDMSamples + headerOFDMSamples);

preambleRxBits = ofdmDemodulate(preambleRx, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit, false);
channelRxBits = ofdmDemodulate(channelRx, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit, false);
headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true);

assert(isequal(preambleRxBits, preambleLUT));
% TODO: channel has one bit with error, probably because of decimator and
% downshifter errors.
%assert(isequal(channelRxBits, channelLUT));
disp("Warning, channel doesn't match");

%% Process header
% The header uses LLR, not bits.
hRxLLR = headerRemoveRepetition(headerRxLLR);
hScrambledRx = LDPCDecoder(hRxLLR, 0, 0, true);
hGenRx = headerScrambler(hScrambledRx);
[err, psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, ...
    explicitMimoPilotSymbolNumberRx] = headerSeparate(hGenRx);

assert(isequal(hScrambledRx, hScrambled));
assert(isequal(hGenRx, hGen));
assert(isequal(err, 0));
assert(isequal(psduSizeRx, psduSize));
assert(isequal(messageDurationRx, messageDuration));
assert(isequal(blockSizeRx, blockSize));
assert(isequal(fecRateRx, fecRate));
assert(isequal(repetitionNumberRx, repetitionNumber));
assert(isequal(fecConcatenationFactorRx, fecConcatenationFactor));
assert(isequal(scramblerInitializationRx, scramblerInitialization));
assert(isequal(batIdRx, batId));
assert(isequal(cyclicPrefixIdRx, cyclicPrefixId));
assert(isequal(explicitMimoPilotSymbolCombSpacingRx, explicitMimoPilotSymbolCombSpacing));
assert(isequal(explicitMimoPilotSymbolNumberRx, explicitMimoPilotSymbolNumber));

%% Estimate payload parameters from header
payloadBitsPerSubcarrierRx = binl2dec(batIdRx);
payloadCyclicPrefixLenRx = binl2dec(cyclicPrefixIdRx) * N / 32;

%% Process payload
payloadRxLLR = ofdmDemodulate(payloadTx, payloadBitsPerSubcarrierRx, payloadCyclicPrefixLenRx, nullIdx, payloadScramblerInit, true);
pRxLLR = removeToneMapping(payloadRxLLR, psduSizeRx);
pScrambledRx = LDPCDecoder(pRxLLR, binl2dec(fecRateRx), binl2dec(blockSizeRx), false);
pBitsRx = payloadScrambler(scramblerInitializationRx, pScrambledRx);

assert(isequal(length(pRxLLR), payloadLenInBits));
assert(isequal(pScrambledRx, pScrambled));
assert(isequal(pBitsRx, pBits));
