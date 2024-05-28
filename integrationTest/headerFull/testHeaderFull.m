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
paramFile(1) = "param1.m";
[reg0, reg1, reg2, reg3] = param2regs(paramFile(1));
newFrame = logical([1; 0]);

%% Simulation Time
fs = 1;                     % Output sample frequency
latency = 500;             % Algorithm latency. Delay between input and output
stopTime = (length(newFrame)-1)/(fs) + latency;

%% Run the simulation
model_name = "HDLHeaderFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
expectedOut = zeros(headerBitsPerOFDMSymbol, length(paramFile));
for i=1:length(paramFile)
    run(paramFile(i));
    h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
            fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
            explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
    h = headerScrambler(h);
    h = LDPCEncoder(h, 0, 0, true);
    expectedOut(:,i) = headerRepetitionEncoder(h);
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
