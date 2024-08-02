%% Test transmission and reception with a random delay applied
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

parametersFile = "parameters.m";
% TODO: funciona si delay es par, pero si es impar se rompe.
% Asumo que es por el desfase del downshifter, ya que se corre el lugar
% donde empieza el símbolo.
delay = 3;
bitLen = 560;
SNR = 120;

pBits = logical(randi([0 1], bitLen, 1));

% Tx
OFDMSignal = fullTx(parametersFile, pBits);

% Channel
% Note, since the signal is upsampled, the delay should be doubled.
OFDMSignal = [false(delay*2, 1); OFDMSignal];
OFDMSignal = awgn(OFDMSignal, SNR);

% Rx
pBitsRx = fullRx(OFDMSignal);

assert(isequal(pBits, pBitsRx));
disp("Test Successfull!");
