%% IEEE 802.15.13 Transmitter
% Full implementation of the PHY of the IEEE 802.15.13-2023 standard.
clc; clear; close all;
addpath("src");
addpath("inc")
constants;
parameters;

%% Header
h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(h);
h = LDPCEncoder(h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(h);

%% Payload
p = logical(randi([0,1], payloadBitsPerBlock0, 1));
p = payloadScrambler(scramblerInitialization, p);
p = LDPCEncoder(p, binl2dec(fecRate), binl2dec(blockSize), false);
p = puncturing(p, binl2dec(fecRate), binl2dec(blockSize));
p = payloadRepetitionEncoder(p, binl2dec(repetitionNumber));
payloadOFDMSymbols = toneMapping(p, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

%% Plotting
tx = [preambleTx(:); channelTx(:); headerTx(:); payloadTx(:);];
t = (0:1:length(tx) - 1).';
plot(t, tx);
