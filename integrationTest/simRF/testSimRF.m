%% Test Sim RF
% Test the process of:
%   - Tx Interpolation
%   - Tx Decimation
%   - Frequency upshifting
%   - Frequency downshifting
%   - Rx Interpolation
%   - Rx Decimation
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
% OFDM output is a senoidal function
% t = (0:1/CONST.fPHY : (CONST.N+CONST.headerCyclicPrefixLen)/CONST.fPHY - 1/CONST.fPHY)';      % Time vector is equal to "N" ofdm samples
% fc = 20e6;                           % Carrier frequency for sinusoidal function
% OFDMSignal = cos(2*pi*fc*t);

%% OFDM output is an actual OFDM symbol
pBits = [];
run("sampleParametersFile.m");

% Header
hGen = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(CONST, hGen);
hLDPC = LDPCEncoder(CONST, hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(CONST, hLDPC);


% Transmiter
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);
channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);
headerTx = ofdmModulate(CONST, headerOFDMSymbols, CONST.headerBitsPerSubcarrier, ...
    CONST.headerCyclicPrefixLen, CONST.headerScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx];

%% ExpectedOut
expectedOut = txInterpolator(CONST, OFDMSignal);
%expectedOut = txDecimator(CONST, expectedOut);
expectedOut = upshifter(CONST, expectedOut);
expectedOut = downshifter(CONST, expectedOut);
expectedOut = rxInterpolator(CONST, expectedOut);
expectedOut = rxDecimator(CONST, expectedOut);

assert(iskindaequal(expectedOut, OFDMSignal, 1), "Input and Output should be similar");

%% Plot signals
t = (0:1:length(expectedOut)-1)/CONST.fADC;

figure();
subplot(2,1,1)
plot(t*1e6, abs(OFDMSignal), t*1e6, abs(expectedOut));
xlabel("Time [useg]");
legend("Input", "Output");
xlim([min(t), max(t)]*1e6);

subplot(2,1,2)
plot(t*1e6, abs(OFDMSignal - expectedOut));
xlabel("Time [useg]");
title("|out - expectedOut|");
xlim([min(t), max(t)]*1e6);
grid on;

disp("Test successfull!");
