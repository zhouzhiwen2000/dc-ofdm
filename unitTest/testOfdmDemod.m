%% Test OFDM Demod
% This test assumes perfect synchronization for the input data
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
pBits = [];
run("sampleParametersFile.m");

% Size of the header after FEC encoding
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);

channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);

h = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(CONST, h);
h = LDPCEncoder(CONST, h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(CONST, h);

headerTx = ofdmModulate(CONST, headerOFDMSymbols, ...
    CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
    CONST.headerScramblerInit);

out1 = ofdmDemodulate(CONST, preambleTx, CONST.preambleBitsPerSubcarrier, ...
    CONST.preambleCyclicPrefixLen, CONST.preambleScramblerInit, false);
expectedOut1 = CONST.preambleLUT;

out2 = ofdmDemodulate(CONST, channelTx, CONST.channelBitsPerSubcarrier, ...
    CONST.channelCyclicPrefixLen, CONST.channelScramblerInit, false);
expectedOut2 = CONST.channelLUT;

out3 = ofdmDemodulate(CONST, headerTx, CONST.headerBitsPerSubcarrier, ...
    CONST.headerCyclicPrefixLen, CONST.headerScramblerInit, false);
expectedOut3 = headerOFDMSymbols(:);

%% Perform tests
assert(isequal(expectedOut1, out1));
assert(isequal(expectedOut2, out2));
assert(isequal(expectedOut3, out3));

disp("Test successful!");
