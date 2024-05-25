%% IEEE 802.15.13 Transmitter
% Full implementation of the PHY of the IEEE 802.15.13-2023 standard.
clc; clear; close all;
addpath("src");
addpath("inc")
constants;
parameters;

%% Header
header = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
ha = headerScrambler(header);
hb = LDPCEncoder(ha, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(hb, headerBitsPerOFDMSymbol);

%% Payload
payload = true(960, 1);
pa = payloadScrambler(scramblerInitialization, payload);
pb = LDPCEncoder(pa, binl2dec(fecRate), binl2dec(blockSize), false);
pc = puncturing(pb, binl2dec(fecRate), binl2dec(blockSize));
pd = payloadRepetitionEncoder(pc, 1);

% TODO tone mapping
% TODO ofdmModulate

%% Transmiter
% Quiero tener todos los datos almacenados en una RAM, e ir sacando de a un
% símbolo OFDM a la vez. El preámbulo, el header y el payload tienen
% distintos valores de CP, modulación QAM, etc.

ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);





