%% Test OFDM Mod
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
cpLen = 16;
nSym = 5;

validIn = true(numDataCarriers*nSym, 1);
dataSymbols = randi([0 255], length(validIn), 1) + 1i*randi([0 255], length(validIn), 1);

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 3000;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLOFDMMod";

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
    data = reshape(dataSymbols, [], nSym);
    expectedOut = ofdmmod(data, N, cpLen, nullIdx);
    assert(iskindaequal(expectedOut, out), "OFDM output is not the same");
   
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
