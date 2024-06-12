%% Test Modulator full implementation with:
% - Input data simulating a RAM with a full frame, formatted with 12 bits 
% per symbol (no matter the actual QAM modulation order).
% - Tone mapping.
% - QAM modulation.
% - Constellation scrambler.
% - OFDM modulator.
% - Frequency up-shift.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;
parameters;

%% Inputs

dataSymbols = preambleOFDMSymbols(:);

bitsPerSubcarrier = repmat(preambleBitsPerSubcarrier, length(dataSymbols), 1);
init = repmat(preambleScramblerInit, length(dataSymbols), 1);
cpLen = repmat(preambleCyclicPrefixLen, length(dataSymbols), 1);
validIn = true(length(dataSymbols), 1);

%% Simulation Time
latency = 10000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLModulatorFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");

expectedOut = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
expectedOut = expectedOut(:);

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    
    assert(iskindaequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = (0:1:length(expectedOut)-1)';

figure();
subplot(2,1,1)
plot(n, out, n, expectedOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
grid on;

subplot(2,1,2)
plot(n, abs(out - expectedOut));
xlabel("n [samples]");
title("|out - expectedOut|");
grid on;

disp("Test successfull!");