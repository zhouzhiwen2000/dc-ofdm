%% Test transmission and reception of and empty payload
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");

%% Parameters
parametersFile = "sampleParametersFile.m";
delayIn = 200;
SNR = 60;
frequencyOffsetIn = 5e3;

%% Message transmission
pBits = [];
OFDMSignal = fullTx(parametersFile, pBits);

OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);

[pBitsRx, err, delayOut, frequencyOffsetOut] = fullRx(OFDMRx, frequencyOffsetIn);

%% Tests
assert(err==0, "The header should have been received without errors");
assert(isempty(pBitsRx), "Received message should be empty");
assert(iskindaequal(delayOut, delayIn/2, 1), "Delays should match");
assert(iskindaequal(frequencyOffsetIn, -frequencyOffsetOut, 50), ...
    "Frequency offset should be less than 50Hz");

disp("Test Successfull!");