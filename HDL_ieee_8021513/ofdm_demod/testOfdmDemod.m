%% Test OFDM Demod
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
cpLen = 16;
nSym = 5;

input = rand(CONST.numDataCarriers, nSym) + 1i*rand(CONST.numDataCarriers, nSym);
dataSymbols = ofdmmod(input, CONST.N, cpLen, CONST.nullIdx);
validIn = true(length(dataSymbols), 1);
dataSymbols = dataSymbols(:);

expectedOut = input;

%% Simulation Time
latency = 3000/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLOfdmDemod";

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
    assert(iskindaequal(expectedOut(:,i), out, 0.05), "OFDM output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = 1:1:length(out);

figure();
subplot(2,1,1)
plot(n, abs(out), n, abs(expectedOut(:,nSym)));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([n(1), n(end)]);
grid on;

subplot(2,1,2)
plot(n, abs(out - expectedOut(:,nSym)));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([n(1), n(end)]);
grid on;

disp("Test successfull!");
