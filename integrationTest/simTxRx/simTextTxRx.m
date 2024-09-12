%% Test transmission and reception of text
% TODO: check ehy adding the frequency offset in the upshifter brings wrong
% results, but in the downshifter is properly detected and corrected.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Parameters
parametersFile = "sampleParametersFile.m";
delayIn = 200;
SNR = 60;
msg = 'From the VLC UTN project we wish you, the reader, a good day.';
frequencyOffsetIn = 5e3;

%% Message transmission
pBits = str2binl(msg);
OFDMSignal = fullTx(CONST, parametersFile, pBits);

OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);

[pBitsRx, err, delayOut, frequencyOffsetOut] = fullRx(CONST, OFDMRx, frequencyOffsetIn);

%% Tests
msgRx = binl2str(pBitsRx);
assert(err==0, "The header should have been received without errors");
assert(isequal(msg, msgRx), "Message should be equal");
assert(iskindaequal(delayOut, delayIn/(CONST.rxM/CONST.rxL), 1), "Delays should match");
assert(iskindaequal(frequencyOffsetIn, -frequencyOffsetOut, 50), ...
    "Frequency offset should be less than 50Hz");

disp("Test Successfull!");
