%% Test transmission and reception of text
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");

%% Parameters
parametersFile = "sampleParametersFile.m";
delayIn = 200;  % TODO, test odd delays
SNR = 60;
msg = 'From the VLC UTN project we wish you, the reader, a good day.';
frequencyOffsetIn = 0e3; % TODO, add frequency correction and re test

%% Message transmission
pBits = str2binl(msg);
OFDMSignal = fullTx(parametersFile, pBits);

OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);

[pBitsRx, err, delayOut, frequencyOffsetOut] = fullRx(OFDMRx, frequencyOffsetIn);

%% Tests
msgRx = binl2str(pBitsRx);
assert(err==0, "The header should have been received without errors");
assert(isequal(msg, msgRx), "Message should be equal");
assert(iskindaequal(delayOut, delayIn/2, 1), "Delays should match");
assert(iskindaequal(frequencyOffsetIn, frequencyOffsetOut, 50), ...
    "Frequency offset should be less than 50Hz");

disp("Test Successfull!");
