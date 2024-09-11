%% Test Constellation Scrambler
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
delay = zeros(CONST.numDataCarriers,13);

si{1} = true(CONST.numDataCarriers, 13);
si{2} = true(CONST.numDataCarriers,13);
si{3} = repmat(CONST.channelScramblerInit, CONST.numDataCarriers, 1);
si{4} = repmat(CONST.headerScramblerInit, CONST.numDataCarriers, 1);
si{5} = repmat(CONST.payloadScramblerInit, CONST.numDataCarriers, 1);

input{1} = ones(CONST.numDataCarriers, 1);
input{2} = ones(CONST.numDataCarriers,1);
input{3} = randi([0 255], CONST.numDataCarriers, 1) + 1i*randi([0 255], CONST.numDataCarriers, 1);
input{4} = randi([0 255], CONST.numDataCarriers, 1) + 1i*randi([0 255], CONST.numDataCarriers, 1);
input{5} = randi([0 255], CONST.numDataCarriers, 1) + 1i*randi([0 255], CONST.numDataCarriers, 1);

scramblerInit = [
    si{1};
    si{2};
    si{3};
    si{4};
    si{5};
];

dataSymbols = [
    input{1};
    input{2};
    input{3};
    input{4};
    input{5};
];

validIn = true(length(dataSymbols), 1);

%% Simulation Time
latency = 300/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLConstellationScrambler";

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
    expectedOut = constellationScrambler(input{i}, si{i}(1,:));
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
    disp("A")
end

disp("Test successfull!");
