%% Test Header FEC
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
delay = false(500,1);

input{1} = logical(randi([0 1], headerBitsPerFec, 1));
input{2} = logical(randi([0 1], headerBitsPerFec, 1));

dataBits = [
    input{1};
    delay; 
    input{2};];

validIn = [
    true(headerBitsPerFec, 1);
    delay;
    true(headerBitsPerFec, 1);];

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 300;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

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
    expectedOut = headerRepetitionEncoder(input{i});
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");
