%% Test Header FEC
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
delay = false(500,1);

input{1} = logical(randi([0 1], CONST.headerBitsPerFec, 1));
input{2} = logical(randi([0 1], CONST.headerBitsPerFec, 1));

dataBits = [
    input{1};
    delay; 
    input{2};];

validIn = [
    true(CONST.headerBitsPerFec, 1);
    delay;
    true(CONST.headerBitsPerFec, 1);];

%% Simulation Time
fs = 1/8;                 % Output sample frequency
latency = 300;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/(8*fs) + latency;

%% Run the simulation
model_name = "HDLHeaderRepetition";

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
    expectedOut = headerRepetitionEncoder(CONST, input{i});
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
