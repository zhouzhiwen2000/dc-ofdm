%% Test Preamble Generate
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
newFrame = logical([ ...
    1; ...
    false(5000, 1); ...
    1; ...
    false(5000, 1)]);

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 100;          % Algorithm latency. Delay between input and output
stopTime = (length(newFrame)-1)/fs + latency;

%% Run the simulation
model_name = "HDLChannelGen";

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

expectedOut = CONST.channelLUT;

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");
