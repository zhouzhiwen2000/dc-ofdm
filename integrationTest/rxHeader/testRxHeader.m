%% Test Header Separate
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
paramFile = "param.m";
run(paramFile);
[reg0, reg1, reg2, reg3] = param2regs(paramFile, false);

h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(h);
h = LDPCEncoder(h, 0, 0, true);
h = headerRepetitionEncoder(h);
h = ofdmModulate(h, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
dataLLR = ofdmDemodulate(h, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true);

dataLLR = [dataLLR; zeros(5000, 1); dataLLR];

startIn = [
    true; false(length(dataLLR)-1, 1); false(5000, 1);
    true;
];

%% Simulation Time
latency = 10000/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(dataLLR)-1)/(2*fPHY) + latency;

%% Run the simulation
model_name = "HDLRxHeader";

load_system(model_name);
simOut = sim(model_name);

headerEndOut = get(simOut, "endOut");

reg0Out = get(simOut, "reg0Out");
reg1Out = get(simOut, "reg1Out");
reg2Out = get(simOut, "reg2Out");
reg3Out = get(simOut, "reg3Out");

%% Compare with MATLAB reference algorithm
headerEndOutIdx = find(headerEndOut == true);

assert(~isempty(headerEndOutIdx), ...
    "headerEndOutIdx shouldn't be empty");
assert(isequal(length(headerEndOutIdx), 2), ...
    "There should be the same amount of headers received than messages sent.");

for i=1:i:length(headerEndOutIdx)
    assert(isequal(reg0Out(headerEndOutIdx(i)), reg0));
    assert(isequal(reg1Out(headerEndOutIdx(i)), reg1));
    assert(isequal(reg2Out(headerEndOutIdx(i)), reg2));
    assert(isequal(reg3Out(headerEndOutIdx(i)), reg3));
end

disp("Test successfull!");
