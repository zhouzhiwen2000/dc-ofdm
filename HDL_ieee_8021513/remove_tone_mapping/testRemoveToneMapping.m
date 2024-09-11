%% Test Remove Tone Mapping
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
delay = false(500,1);

payloadLenInFecBlocks = 3;
payloadLenInBits = payloadLenInFecBlocks*CONST.payloadBitsPerBlock0;
payloadLenInWords = payloadLenInBits/CONST.axiWidth;
psduSize = flip(dec2binl(payloadLenInWords, 24))';

% Note: Since where are using fec rate 1/2, the actual len is multiplied by
% 2. Only valid if fec rate = 1/2.
payloadLenInBitsAfterFec = payloadLenInBits*2;

input{1} = logical(randi([0 1], payloadLenInBitsAfterFec, 1));
input{2} = logical(randi([0 1], payloadLenInBitsAfterFec, 1));

input{1} = toneMapping(CONST, input{1}, 4);
input{1} = input{1}(:);

input{2} = toneMapping(CONST, input{2}, 2);
input{2} = input{2}(:);

expectedOut{1} = removeToneMapping(CONST, input{1}, flip(psduSize));
expectedOut{2} = removeToneMapping(CONST, input{2}, flip(psduSize));

dataIn = [
    input{1};
    delay; 
    input{2};
];

validIn = [
    true(size(input{1}));
    delay;
    true(size(input{2}));
];

newFrame = true;

%% Simulation Time
latency = 10/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLRemoveToneMapping";

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

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut{i}, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
