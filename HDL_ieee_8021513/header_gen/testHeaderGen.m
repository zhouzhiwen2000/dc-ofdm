%% Test Header Generatation
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
psduSize = logical([ ...
    0 1 0 1 0 1 0 1 ...
    0 0 1 1 1 0 0 0 ...
    1 0 1 0 1 0 1 0]);

messageDuration = logical([ ...
    0 0 1 1 0 0 1 1 ...
    1 1 0 1 1 0 0 0]);

blockSize = logical([0 1]);
fecRate = logical([0 0 1]);
repetitionNumber = logical([0 1 1]);
fecConcatenationFactor = logical([1 0 0]);
scramblerInitialization = logical([0 1 0 0]);
batId = logical([0 0 0 1 0]);
cyclicPrefixId = logical([1 0 0]);
explicitMimoPilotSymbolCombSpacing = logical([0 0 1]);
explicitMimoPilotSymbolNumber = logical([1 0 0]);

newFrame = logical([ ...
    1; ...
    false(500, 1)]);

reg0 = binl2dec(logical([false(1,8) psduSize]));

reg1 = binl2dec(logical([false(1, 16) messageDuration]));

reg2 = binl2dec(logical([ ...
    0 0 0 0 0 fecConcatenationFactor ...
    0 0 0 0 0 repetitionNumber ...
    0 0 0 0 0 fecRate ...
    0 0 0 0 0 0 blockSize]));

reg3 = binl2dec(logical([ ...
    0 0 explicitMimoPilotSymbolNumber explicitMimoPilotSymbolCombSpacing ...
    0 0 0 0 0 cyclicPrefixId ...
    0 0 0 batId ...
    0 0 0 0 scramblerInitialization]));

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 300;         % Algorithm latency. Delay between input and output
stopTime = (length(newFrame)-1)/fs + latency;

%% Run the simulation
model_name = "HDLHeaderGen";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
psduSizeDouble = binl2dec(psduSize);
messageDurationDouble = 0.25e-6 * double(binl2dec(messageDuration));

expectedOut = headerGenerate(psduSizeDouble, messageDurationDouble, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
expectedOut = expectedOut(1:end-16); % Remove CRC

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty")
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");

