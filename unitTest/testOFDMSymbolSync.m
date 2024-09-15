%% Test OFDM Symbol Sync
% Implementacion del algoritmo de Cox para sincronizar OFDM.
% Nota: se probó generar un prefijo cíclico extra en el primer símbolo
% OFDM, pero no se observó una "meseta" en la ubicación del pico como
% indica el paper de Cox.
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Parameters
parametersFile = "sampleParametersFile";
pBits = logical(randi([0,1], CONST.payloadBitsPerBlock0*3, 1));
delayIn = 3000; % Delay added to the signal
SNR = 60;
frequencyOffsetUpshifter = 0e3;
frequencyOffsetDownshifter = 1e3;

%% Get OFDM signal before OFDM demodulation
OFDMTx = fullTx(CONST, parametersFile, pBits, frequencyOffsetUpshifter);
OFDMRx = channelSimulation(OFDMTx, delayIn, SNR);
OFDMRx = downshifter(CONST, OFDMRx, frequencyOffsetDownshifter);
%OFDMRx = rxInterpolator(CONST, OFDMRx);
OFDMRx = rxDecimator(CONST, OFDMRx);

%% Synchronize
[ofdmOut, delayOut, M, peaks, frequencyOffset] = ofdmSymbolSync(CONST, OFDMRx);

%% Test
delayOut
peaks
frequencyOffset

assert(isequal(delayOut, delayIn/(CONST.rxM/CONST.rxL)), "Delays should match");
assert(isscalar(peaks), "Only one peak should be detected");
assert(isequal(ofdmOut, OFDMRx(1+delayOut+CONST.preambleOFDMSamples:end)), ...
    "OFDM output signal should remove the delay and preamble signal");
assert(iskindaequal(frequencyOffsetDownshifter, -frequencyOffset, 50));

plot(M)