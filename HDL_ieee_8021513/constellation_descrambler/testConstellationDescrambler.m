%% Test Constellation Scrambler
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
si{1} = true(CONST.numDataCarriers, 13);
si{2} = true(CONST.numDataCarriers, 13);
si{3} = repmat(CONST.channelScramblerInit, CONST.numDataCarriers, 1);
si{4} = repmat(CONST.headerScramblerInit, CONST.numDataCarriers, 1);
si{5} = repmat(CONST.payloadScramblerInit, CONST.numDataCarriers, 1);

input{1} = ones(CONST.numDataCarriers, 1);
input{2} = ones(CONST.numDataCarriers,1);
input{3} = rand(CONST.numDataCarriers, 1) + 1i*rand(CONST.numDataCarriers, 1);
input{4} = rand(CONST.numDataCarriers, 1) + 1i*rand(CONST.numDataCarriers, 1);
input{5} = rand(CONST.numDataCarriers, 1) + 1i*rand(CONST.numDataCarriers, 1);

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
    constellationScrambler(input{1}, si{1}(1,:), false);
    false(10, 1);
    constellationScrambler(input{2}, si{2}(1,:), false);
    false(10, 1);
    constellationScrambler(input{3}, si{3}(1,:), false);
    false(10, 1);
    constellationScrambler(input{4}, si{4}(1,:), false);
    false(10, 1);
    constellationScrambler(input{5}, si{5}(1,:), false);
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
latency = 300/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fPHY + latency;

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
    expectedOut = input{i};
    assert(iskindaequal(expectedOut, out, 1e-3));
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
