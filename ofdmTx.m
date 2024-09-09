%% IEEE 802.15.13 Transmitter
% Full implementation of the PHY of the IEEE 802.15.13-2023 standard.
clc; clear; close all;
addpath("src");
addpath("inc")
constants;

%% Parameters
parametersFile = "inc/sampleParametersFile";
pBits = logical(randi([0,1], CONST.payloadBitsPerBlock0*3, 1));

run(parametersFile);

%% Header
hGen = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(CONST, hGen);
hLDPC = LDPCEncoder(CONST, hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(CONST, hLDPC);

%% Payload
pBits = reshape(pBits, CONST.payloadBitsPerBlock0, payloadLenInFecBlocks);
pLDPC = false(CONST.payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambled = payloadScrambler(CONST, scramblerInitialization, pBits(:,i));
    pLDPC(:,i) = LDPCEncoder(CONST, pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
end
pLDPC = pLDPC(:);
payloadOFDMSymbols = toneMapping(CONST, pLDPC, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);

channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);

headerTx = ofdmModulate(CONST, headerOFDMSymbols, ...
    CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
    CONST.headerScramblerInit);

payloadTx = ofdmModulate(CONST, payloadOFDMSymbols, ...
    payloadBitsPerSubcarrier, payloadCyclicPrefixLen, ...
    CONST.payloadScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = txInterpolator(CONST, OFDMSignal);
OFDMSignal = txDecimator(CONST, OFDMSignal);
OFDMSignal = upshifter(CONST, OFDMSignal);
