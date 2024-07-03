%% Test Header Separate
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
paramFile = "param.m";
run(paramFile);

input = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
input = input(1:end-16);

[reg0, reg1, reg2, reg3] = param2regs(paramFile);

dataBits = input;
validIn = true(size(input));

%% Simulation Time
latency = 100/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/(2*fPHY) + latency;

%% Run the simulation
model_name = "HDLHeaderSeparate";

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
