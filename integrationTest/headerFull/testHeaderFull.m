%% Test header full implementation, with:
% - Header generation from registers.
% - Header CRC generation.
% - Header scrambler.
% - Header FEC encoder.
% - Header Repetition encoder.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = ["param1.m", "param2.m"];
for i=1:1:length(paramFile)
    [reg0(i), reg1(i), reg2(i), reg3(i)] = param2regs(CONST, paramFile(i), false);
end
newFrame = logical([1; 0]);

%% Simulation Time
latency = 10000/CONST.fs;             % Algorithm latency. Delay between input and output
stopTime = latency;

%% Run the simulation
model_name = "HDLHeaderFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
expectedOut = zeros(CONST.headerBitsPerOFDMSymbol, length(paramFile));
for i=1:length(paramFile)
    run(paramFile(i));
    h = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
            fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
            explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
    h = headerScrambler(CONST, h);
    h = LDPCEncoder(CONST, h, 0, 0, true);
    expectedOut(:,i) = headerRepetitionEncoder(CONST, h);
end

%% Actual test
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(paramFile)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut(:,i), out));
end

disp("Test successfull!");
