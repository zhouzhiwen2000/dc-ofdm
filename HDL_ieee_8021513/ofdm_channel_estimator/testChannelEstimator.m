%% Test OFDM Channel Estimator
% TODO: test with customized channel
% Besides, the channel should be all "ones", but is kinda noisy for some
% subcarriers.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
delayBetweenOFDMSymbols = false(100, 1);
paramFile = "sampleParametersFile";
pBits = [];
OFDMTx = fullTx(CONST, paramFile, pBits, 0, false);
OFDMRx = downshifter(CONST, OFDMTx);
OFDMRx = rxDecimator(CONST, OFDMRx);
OFDMRx = OFDMRx(1+CONST.preambleOFDMSamples:end);

% Demodulate channel and header
channelRx = OFDMRx(1:CONST.channelOFDMSamples); 
headerRx = OFDMRx(1+CONST.channelOFDMSamples:end);

channelCarriers = ofdmdemod(channelRx, CONST.N, ...
    CONST.channelCyclicPrefixLen, 0, CONST.nullIdx);
headerCarriers = ofdmdemod(headerRx, CONST.N, ...
    CONST.headerCyclicPrefixLen, 0, CONST.nullIdx);

for i=1:1:width(channelCarriers)
    channelCarriers(:,i) = constellationScrambler( ...
        channelCarriers(:,i), CONST.channelScramblerInit, true);
end

for i=1:1:width(headerCarriers)
    headerCarriers(:,i) = constellationScrambler( ...
        headerCarriers(:,i), CONST.headerScramblerInit, true);
end
dataIn = [
    channelCarriers(:,1);
    delayBetweenOFDMSymbols;
    channelCarriers(:,2);
    delayBetweenOFDMSymbols;
    headerCarriers(:);
];

validDataIn = [
    false(length(channelCarriers(:)), 1);
    delayBetweenOFDMSymbols;
    delayBetweenOFDMSymbols;
    true(length(headerCarriers(:)), 1);
];

validChannelIn = [
    true(length(channelCarriers(:,1)), 1);
    delayBetweenOFDMSymbols;
    true(length(channelCarriers(:,2)), 1);
];

%% Expected Output
[OFDMHeader, channelEst] = ofdmChannelEstimation(CONST, OFDMRx);
    
qamSignalScrambled = ofdmdemod(OFDMHeader, CONST.N, ...
    CONST.headerCyclicPrefixLen, 0, CONST.nullIdx);

qamSignal = zeros(size(qamSignalScrambled));
 for i=1:1:width(qamSignalScrambled)
    qamSignal = constellationScrambler(qamSignalScrambled(:,i), ...
        CONST.headerScramblerInit, true);
    qamSignal = ofdmChannelEqualizer(qamSignal, channelEst);
 end

 expectedChannelEst = channelEst;
 expectedOut = qamSignal;

%% Simulation Time
latency = 300/CONST.fPHY;
stopTime = (length(dataIn)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLChannelEstimator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");
channelEstOut = get(simOut, "channelEstOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)));

% Channel estimation test
outChannel = channelEstOut(startIdx(1):endIdx(1));
assert(iskindaequal(expectedChannelEst, outChannel, 1e-3));

% Equalized output test
for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 1e-3));
end

%% Plotting
figure();
n = 0:1:length(expectedChannelEst)-1;

subplot(2,1,1);
plot(n, abs(outChannel), n, abs(expectedChannelEst));
legend("Out Channel Estimation", "Expected Channel Estimation");
xlabel("n [samples]");
ylabel("Est");
title("Channel estimation");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(outChannel-expectedChannelEst));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

figure();
n = 0:1:length(expectedOut)-1;

subplot(2,1,1);
plot(n, abs(out), n, abs(expectedOut));
legend("Out equalized", "Expected equalized");
xlabel("n [samples]");
ylabel("Signal");
title("Equalized signal = S./H");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;


disp("Test Successful!");
