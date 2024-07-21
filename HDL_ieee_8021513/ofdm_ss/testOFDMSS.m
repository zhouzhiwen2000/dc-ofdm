%% Test OFDM Symbol Sync
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
delay = 5000; % Number of samples that the preamble is delayed
SNR = 40;

preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);

energy = 1/sqrt(2)*abs(mean(preambleTx));

noise = energy*rand(delay, 1) + 1i*energy*rand(delay, 1);

dataIn = [noise; preambleTx; noise;];
dataIn = awgn(dataIn, SNR);     % Add noise

validIn = true(size(dataIn));

[~, expectedDelayOut, expectedOut] = ofdmSymbolSync(dataIn);
expectedDelayOut

%% Simulation Time
latency = (delay+300)/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLOFDMSS";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");
peakOut = get(simOut, "peakOut");
indexOut = get(simOut, "indexOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 10e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

% The delay for the OFDM signal is the first detected peak
indexes = find(peakOut ~= 0);
delayOut = indexOut(indexes(2)) % TODO, index 1 below 100? Why

assert(iskindaequal(delayOut, expectedDelayOut, 10));

%% Plotting
figure();
n = 0:1:length(out)-1;

subplot(2,1,1);
plot(n, real(out), n, real(expectedOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("M(d)");
title("M(d) = |P|^2/Rf^2");
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
