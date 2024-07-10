%% Test OFDM Symbol Sync
% Implementacion del algoritmo de Cox para sincronizar OFDM.
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");

%% Parameters
sampleOFDMSignal;
delay = 3000; % Delay added to the signal
OFDMSignalDelayed = [OFDMSignal(end-delay*2+1:end); OFDMSignal];

OFDMSignalDelayed = awgn(OFDMSignalDelayed, 30);

%% Get complex signal
OFDMRx = downshifter(OFDMSignalDelayed);
OFDMRx = decimator(OFDMRx);

%% Synchronize
[ofdmOut, delayOut, M] = ofdmSymbolSync(OFDMRx);

%% Test
delayOut
plot(M)

