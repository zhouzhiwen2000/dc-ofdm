%% Test Header CRC Rx
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;
param;

%% Inputs
delay = false(500,1);

input{1} = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
expectedOut{1} = input{1}(1:end-16);
expectedErr{1} = false;

% Change one bit and expect and error.
input{2} = input{1};
input{2}(142) = ~input{2}(142);
expectedOut{2} = input{2}(1:end-16);
expectedErr{2} = true;

input{3} = input{1};
expectedOut{3} = input{3}(1:end-16);
expectedErr{3} = false;

dataBits = [
    input{1};
    delay; 
    input{2};
    delay;
    input{3};
];

validIn = [
    true(size(input{1}));
    delay;
    true(size(input{2}));
    delay;
    true(size(input{3}));
];

%% Simulation Time
latency = 200/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLHeaderCRCRx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");
errOut = get(simOut, "errOut");

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut{i}, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
    assert(isequal(errOut(endIdx(i)), expectedErr{i}));
end

disp("Test successfull!");
