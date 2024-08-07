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

startIn = true;

%% Simulation Time
latency = 3000/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(dataLLR)-1)/(2*fPHY) + latency;

%% Run the simulation
model_name = "HDLRxHeader";

load_system(model_name);
simOut = sim(model_name);

endOut = get(simOut, "endOut");
endOutIdx = find(endOut==1);
endOutIdx = endOutIdx(1);

reg0Out = get(simOut, "reg0Out");
reg0Out = reg0Out(endOutIdx);

reg1Out = get(simOut, "reg1Out");
reg1Out = reg1Out(endOutIdx);

reg2Out = get(simOut, "reg2Out");
reg2Out = reg2Out(endOutIdx);

reg3Out = get(simOut, "reg3Out");
reg3Out = reg3Out(endOutIdx);


%% Compare with MATLAB reference algorithm
assert(isequal(reg0Out, reg0));
assert(isequal(reg1Out, reg1));
assert(isequal(reg2Out, reg2));
assert(isequal(reg3Out, reg3));

disp("Test successfull!");
