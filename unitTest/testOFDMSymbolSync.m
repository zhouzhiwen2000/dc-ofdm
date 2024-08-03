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
pBits = logical(randi([0,1], payloadBitsPerBlock0*3, 1));
delayIn = 3000; % Delay added to the signal
SNR = 40;

%% Get OFDM signal before OFDM demodulation
OFDMTx = fullTx(parametersFile, pBits);
OFDMRx = channelSimulation(OFDMTx, delayIn, SNR);
OFDMRx = downshifter(OFDMRx);
OFDMRx = decimator(OFDMRx);

%% Synchronize
[ofdmOut, delayOut, M, peaks] = ofdmSymbolSync(OFDMRx);

%% Test
assert(isequal(delayOut, delayIn/2), "Delays should match");
assert(isscalar(peaks), "Only one peak should be detected");
assert(isequal(ofdmOut, OFDMRx(1+delayOut+preambleOFDMSamples:end)), ...
    "OFDM output signal should remove the delay and preamble signal");

plot(M)
