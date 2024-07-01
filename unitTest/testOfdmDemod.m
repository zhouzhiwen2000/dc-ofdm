%% Test OFDM Demod
% This test assumes perfect synchronization for the input data
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;
parameters;

%% Test cases
% Size of the header after FEC encoding
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);

h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(h);
h = LDPCEncoder(h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(h);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);

out1 = ofdmDemodulate(preambleTx, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit, false);
expectedOut1 = preambleLUT;

out2 = ofdmDemodulate(channelTx, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit, false);
expectedOut2 = channelLUT;

out3 = ofdmDemodulate(headerTx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, false);
expectedOut3 = headerOFDMSymbols(:);

%% Perform tests
assert(isequal(expectedOut1, out1));
assert(isequal(expectedOut2, out2));
assert(isequal(expectedOut3, out3));

disp("Test successful!");
