%% Test OFDM Symbol Sync
% Implementacion del algoritmo de Cox para sincronizar OFDM.
% Nota: se probó generar un prefijo cíclico extra en el primer símbolo
% OFDM, pero no se observó una "meseta" en la ubicación del pico como
% indica el paper de Cox.
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");

%% Parameters
sampleOFDMSignal;
delay = 3000; % Delay added to the signal
OFDMSignalDelayed = [OFDMSignal(end-delay*2+1:end); OFDMSignal];

OFDMSignalDelayed = awgn(OFDMSignalDelayed, 60);

%% Get complex signal
OFDMRx = downshifter(OFDMSignalDelayed);
OFDMRx = decimator(OFDMRx);

%% Synchronize
[ofdmOut, delayOut, M, peaks] = ofdmSymbolSync(OFDMRx);

%% Test
delayOut
plot(M)
peaks

