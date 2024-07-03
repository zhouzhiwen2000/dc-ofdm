%% Test Downshifter
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
nSym = 3;
input{1} = rand(nSym*N*oversamplingFactor, 1);
input{2} = rand(nSym*N*oversamplingFactor, 1);

dataIn = [
    input{1};
    zeros(100, 1);
    input{2};
];

validIn = [
    true(size(input{1}));
    false(100, 1);
    true(size(input{2}));
];

maxError = 1e-3;    % Maximum error between out and expectedOut

%% Simulation Time
latency = 200/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLDownshifter";

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
    n = (0:1:length(input{i})-1)';
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = downshifter(input{i});
    assert(iskindaequal(expectedOut, out, maxError), "Upshifter output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
figure();
subplot(2,1,1);
plot(n, real(out), n, real(expectedOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Signals");
title("Upshifter output");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");
