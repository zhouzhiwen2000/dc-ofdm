%% Test OFDM Mod
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
cpLen = 16;
nSym = 5;

validIn = true(numDataCarriers*nSym, 1);
dataSymbols = rand(length(validIn), 1) + 1i*rand(length(validIn), 1);

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
    assert(iskindaequal(expectedOut, out, 1e-3), "OFDM output is not the same");
   
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = 1:1:length(out);

figure();
subplot(2,1,1)
plot(n, abs(out), n, abs(expectedOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([n(1), n(end)]);
grid on;

subplot(2,1,2)
plot(n, abs(out - expectedOut));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([n(1), n(end)]);
grid on;

disp("Test successfull!");
