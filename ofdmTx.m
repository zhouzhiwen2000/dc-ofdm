%% IEEE 802.15.13 Transmitter
% Full implementation of the PHY of the IEEE 802.15.13-2023 standard.
clc; clear; close all;
addpath("src");
addpath("inc")
constants;

%% Parameters
parametersFile = "inc/sampleParametersFile";
pBits = logical(randi([0,1], payloadBitsPerBlock0*3, 1));

run(parametersFile);

%% Header
hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(hGen);
hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(hLDPC);

%% Payload
pBits = reshape(pBits, payloadBitsPerBlock0, payloadLenInFecBlocks);
pLDPC = false(payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambled = payloadScrambler(scramblerInitialization, pBits(:,i));
    pLDPC(:,i) = LDPCEncoder(pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
end
pLDPC = pLDPC(:);
payloadOFDMSymbols = toneMapping(pLDPC, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = txInterpolator(OFDMSignal);
OFDMSignal = txDecimator(OFDMSignal);
OFDMSignal = upshifter(OFDMSignal);

%% Plotting
%t = (0:1/fs:length(OFDMSignal)/fs - 1/fs).';
%plot(t, OFDMSignal);
