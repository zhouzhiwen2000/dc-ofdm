%% Test Header Separate
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
paramFile{1} = "param.m";
paramFile{2} = "param2.m";

startIn = [];
dataLLR = [];
reg0 = zeros(length(paramFile), 1);
reg1 = zeros(size(reg0));
reg2 = zeros(size(reg0));
reg3 = zeros(size(reg0));
for i =1:1:length(paramFile)
    run(paramFile{i});
    [reg0(i,1), reg1(i,1), reg2(i,1), reg3(i,1)] = param2regs(paramFile{i}, false);
    
    h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
        fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
        explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
    h = headerScrambler(h);
    h = LDPCEncoder(h, 0, 0, true);
    h = headerRepetitionEncoder(h);
    h = ofdmModulate(h, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
    llr = ofdmDemodulate(h, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true);
    
    startIn = [startIn; true; false(length(llr)-1, 1); false(5000, 1);];
    dataLLR = [dataLLR; llr; zeros(5000, 1);];
end

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
assert(isequal(length(headerEndOutIdx), length(paramFile)), ...
    "There should be the same amount of headers received than messages sent.");

for i=1:1:length(headerEndOutIdx)
    assert(isequal(reg0Out(headerEndOutIdx(i)), reg0(i,1)));
    assert(isequal(reg1Out(headerEndOutIdx(i)), reg1(i,1)));
    assert(isequal(reg2Out(headerEndOutIdx(i)), reg2(i,1)));
    assert(isequal(reg3Out(headerEndOutIdx(i)), reg3(i,1)));
end

disp("Test successfull!");
