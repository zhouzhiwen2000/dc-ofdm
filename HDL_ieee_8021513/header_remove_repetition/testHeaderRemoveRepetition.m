%% Test Header FEC
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
delay = false(500,1);

input{1} = logical(randi([0 1], headerBitsPerFec, 1));
input{2} = logical(randi([0 1], headerBitsPerFec, 1));

input{1} = headerRepetitionEncoder(input{1});
input{2} = headerRepetitionEncoder(input{2});

expectedOut{1} = headerRemoveRepetition(input{1});
expectedOut{2} = headerRemoveRepetition(input{2});

dataBits = [
    input{1};
    delay; 
    input{2};
];

startIn = [
    true;
    false(length(input{1}) -1, 1);
    delay;
    true;
];

%% Simulation Time
latency = 10/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLHeaderRemoveRepetition";

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
