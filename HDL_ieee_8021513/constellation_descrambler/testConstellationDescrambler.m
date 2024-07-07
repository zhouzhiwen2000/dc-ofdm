%% Test Constellation Scrambler
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
si{1} = true(numDataCarriers, 13);
si{2} = true(numDataCarriers, 13);
si{3} = repmat(channelScramblerInit, numDataCarriers, 1);
si{4} = repmat(headerScramblerInit, numDataCarriers, 1);
si{5} = repmat(payloadScramblerInit, numDataCarriers, 1);

input{1} = ones(numDataCarriers, 1);
input{2} = ones(numDataCarriers,1);
input{3} = randi([0 255], numDataCarriers, 1) + 1i*randi([0 255], numDataCarriers, 1);
input{4} = randi([0 255], numDataCarriers, 1) + 1i*randi([0 255], numDataCarriers, 1);
input{5} = randi([0 255], numDataCarriers, 1) + 1i*randi([0 255], numDataCarriers, 1);

scramblerInit = [
    si{1};
    false(10, 13);
    si{2};
    false(10, 13);
    si{3};
    false(10, 13);
    si{4};
    false(10, 13);
    si{5};
];

dataSymbols = [
    input{1};
    false(10, 1);
    input{2};
    false(10, 1);
    input{3};
    false(10, 1);
    input{4};
    false(10, 1);
    input{5};
];

validIn = [
    true(length(input{1}), 1);
    false(10, 1);
    true(length(input{2}), 1);
    false(10, 1);
    true(length(input{3}), 1);
    false(10, 1);
    true(length(input{4}), 1);
    false(10, 1);
    true(length(input{5}), 1);
];

%% Simulation Time
latency = 300/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fPHY + latency;

%% Run the simulation
model_name = "HDLConstellationDescrambler";

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
    expectedOut = constellationScrambler(input{i}, si{i}(1,:), true);
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
