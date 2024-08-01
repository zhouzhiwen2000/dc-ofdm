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

% Add noise
dataIn = [zeros(delay, 1); preambleTx; zeros(delay, 1)];
dataIn = awgn(dataIn, SNR);     

validIn = true(size(dataIn));

% Expected output
[~, expectedDelayOut, expectedMOut, expectedPeaksOut] = ofdmSymbolSync(dataIn);

%% Simulation Time
latency = (delay+300)/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLOFDMSS";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
mOut = get(simOut, "mOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");
peakOut = get(simOut, "peakOut");
indexOut = get(simOut, "indexOut");

%% Compare with MATLAB reference algorithm
% Compare first the function "M(d)"
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

% Test that M(d) is equal
for i=1:length(startIdx)
    mOutSim = mOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedMOut, mOutSim, 10e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

% Test that the peaks detected are equal
peaksSim = find(peakOut ~= 0);
peaksSim = indexOut(peaksSim);
assert(isequal(peaksSim, expectedPeaksOut));

% Test that the signal at the output is only the preamble
startPreamble = find(peakOut == true);
startPreamble = startPreamble(1);
preambleWithNoise = dataIn(delay+1:delay+length(preambleTx));
preambleSim = dataOut(startPreamble:startPreamble-1+length(preambleTx));
assert(iskindaequal(preambleSim, preambleWithNoise, 1e-3));


%% Plotting
figure();
n = 0:1:length(mOutSim)-1;

subplot(2,1,1);
plot(n, real(mOutSim), n, real(expectedMOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("M(d)");
title("M(d) = |P|^2/Rf^2");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(mOutSim-expectedMOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");
