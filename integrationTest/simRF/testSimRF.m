%% Test Sim RF
% Test the process of:
%   - Interpolating
%   - Frequency upshifting
%   - Frequency downshifting
%   - Decimating
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
% OFDM output is a senoidal function
t = (0:1/fPHY:(N+headerCyclicPrefixLen)/fPHY-1/fPHY)';      % Time vector is equal to "N" ofdm samples
fc = 20e6;                           % Carrier frequency for sinusoidal function
OFDMSignal = cos(2*pi*fc*t);

%% OFDM output is an actual OFDM symbol
% pBits = [];
% run("sampleParametersFile.m");
% 
% % Header
% hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
%     fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
%     explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
% hScrambled = headerScrambler(hGen);
% hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
% headerOFDMSymbols = headerRepetitionEncoder(hLDPC);
% 
% 
% % Transmiter
% preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
% channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
% headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
% 
% OFDMSignal = [preambleTx; channelTx; headerTx];

%% ExpectedOut
expectedOut = txInterpolator(OFDMSignal);
expectedOut = upshifter(expectedOut);
expectedOut = downshifter(expectedOut);
expectedOut = decimator(expectedOut);

assert(iskindaequal(expectedOut, OFDMSignal, 0.5), "Input and Output should be similar");

%% Plot signals
t = (0:1:length(expectedOut)-1)/fs;

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
