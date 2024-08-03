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

%% Simulate Channel
delayIn = 400;  % Delay in OFDM Samples
OFDMRx = [zeros(delayIn*2, 1); OFDMSignal];

%% Separate Preamble, Channel and Header
% Payload can't be processed until the header was obtained (I need to know
% the cyclic prefix used for the payload)
OFDMRx = downshifter(OFDMRx);
OFDMRx = decimator(OFDMRx);

[OFDMRx, delayOut] = ofdmSymbolSync(OFDMRx);

assert(isequal(delayIn, delayOut), "signal delay was properly detected");

OFDMRx = OFDMRx(1+preambleOFDMSamples:end);

channelRx = OFDMRx(1 : channelOFDMSamples);
headerRx = OFDMRx(channelOFDMSamples+1 : channelOFDMSamples + headerOFDMSamples);
payloadRx = OFDMRx(channelOFDMSamples + headerOFDMSamples + 1: end);

channelEst = ofdmChannelEstimation(channelRx);

headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true, channelEst);


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
% TODO, enable channel EST here
payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrierRx, payloadCyclicPrefixLenRx, nullIdx, payloadScramblerInit, true);
pRxLLR = removeToneMapping(payloadRxLLR, psduSizeRx);
pRxLLR = reshape(pRxLLR, payloadBitsPerFec, payloadLenInFecBlocks);

pBitsRx = false(payloadBitsPerBlock0, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambledRx = LDPCDecoder(pRxLLR(:,i), binl2dec(fecRateRx), binl2dec(blockSizeRx), false);
    pBitsRx(:,i) = payloadScrambler(scramblerInitializationRx, pScrambledRx);
end

%% Assertions
assert(isequal(pBitsRx, pBits));

disp("Transmission successful!");
