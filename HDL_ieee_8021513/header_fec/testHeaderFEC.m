%% Test Header FEC
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
headerBits = 168;

dataBits = logical(randi([0 1], headerBits, 1));
validIn = true(headerBits, 1);
delay = false(5000,1);

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 5000;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLHeaderFEC";

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
    expectedOut = LDPCEncoder(CONST, dataBits, 0, 0, true);
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");
