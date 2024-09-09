%% OFDM RX
% Full implementation of an OFDM RX compliant with IEEE 802.15.13
clc; clear; close all;
addpath("src");
addpath("src/rx")
addpath("inc")
constants;

%% Run transmitter
ofdmTx; % Data is in OFDMSignal

%% Simulate Channel
delayIn = 400;  % Delay in OFDM Samples
OFDMRx = [zeros(delayIn*CONST.rxM/CONST.rxL, 1); OFDMSignal];

%% Separate Preamble, Channel and Header
% Payload can't be processed until the header was obtained (I need to know
% the cyclic prefix used for the payload)
OFDMRx = downshifter(CONST, OFDMRx);
OFDMRx = rxInterpolator(CONST, OFDMRx);
OFDMRx = rxDecimator(CONST, OFDMRx);

[OFDMRx, delayOut] = ofdmSymbolSync(CONST, OFDMRx);

assert(isequal(delayIn, delayOut), "signal delay was properly detected");

[OFDMRx, channelEst] = ofdmChannelEstimation(CONST, OFDMRx);

headerRx = OFDMRx(1 : CONST.headerOFDMSamples);
payloadRx = OFDMRx(1+CONST.headerOFDMSamples : end);

headerRxLLR = ofdmDemodulate(CONST, headerRx, CONST.headerBitsPerSubcarrier, ...
    CONST.headerCyclicPrefixLen, CONST.headerScramblerInit, true, channelEst);

%% Process header
% The header uses LLR, not bits.
hRxLLR = headerRemoveRepetition(CONST, headerRxLLR);
hScrambledRx = LDPCDecoder(CONST, hRxLLR, 0, 0, true);
hGenRx = headerScrambler(CONST, hScrambledRx);
[err, psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, ...
    explicitMimoPilotSymbolNumberRx] = headerSeparate(CONST, hGenRx);

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
payloadCyclicPrefixLenRx = binl2dec(cyclicPrefixIdRx) * CONST.N / 32;

%% Process payload
payloadRxLLR = ofdmDemodulate(CONST, payloadRx, payloadBitsPerSubcarrierRx, ...
    payloadCyclicPrefixLenRx, CONST. payloadScramblerInit, true, channelEst);
pRxLLR = removeToneMapping(CONST, payloadRxLLR, psduSizeRx);
pRxLLR = reshape(pRxLLR, CONST.payloadBitsPerFec, payloadLenInFecBlocks);

pBitsRx = false(CONST.payloadBitsPerBlock0, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambledRx = LDPCDecoder(CONST, pRxLLR(:,i), binl2dec(fecRateRx), binl2dec(blockSizeRx), false);
    pBitsRx(:,i) = payloadScrambler(CONST, scramblerInitializationRx, pScrambledRx);
end

%% Assertions
assert(isequal(pBitsRx, pBits));

disp("Transmission successful!");
