%% Test Rx Modulator full implementation with:
% - Frequency Downshift
% - Decimator
% - OFDM demodulator
% - Constellation descrambler
% - QAM demodulation (with LLR)
% - Output datais formmated to have 4 bits, to be stored 

% TODO: check that this blocks has a significant error from the reference
% model, probably beacuse of the quantization of the ofdm demodulator
% block.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
parametersFile = "sampleParametersFile";
pBits = logical(randi([0,1], payloadBitsPerBlock0*2, 1));
delayIn = 5000;
SNR = 60;
frequencyOffsetIn = 15e3;

OFDMSignal = fullTx(parametersFile, pBits, 0, false);
OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);
run(parametersFile);

% Remove extra samples from time window
dataIn = OFDMRx;
psduSizeLSB = flip(psduSize);

%% ExpectedOutput
OFDMRx = downshifter(OFDMRx);
OFDMRx = decimator(OFDMRx);
OFDMRx = ofdmSymbolSync(OFDMRx);
[OFDMRx, channelEst] = ofdmChannelEstimation(OFDMRx);

headerRx = OFDMRx(1:headerOFDMSamples);
headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true, channelEst);

payloadRx = OFDMRx(1+headerOFDMSamples:end);
payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit, true, channelEst);


expectedHeaderOut{1} = headerRxLLR;

for i=1:1:payloadNumOFDMSymbols
    expectedPayloadOut{i} = payloadRxLLR(1+numDataCarriers*payloadBitsPerSubcarrier*(i-1) : numDataCarriers*payloadBitsPerSubcarrier*i);
end

%% Simulation Time
latency = 1000000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLRxDemodulator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");

startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

lastOut = get(simOut, "lastOut");

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx1), length(endIdx1)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");
assert(~isempty(startIdx1), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i), end-headerBitsPerSubcarrier+1:end);
    out = out.';
    headerOut = out(:);
    assert(iskindaequal(expectedHeaderOut{i}, headerOut, 5), "Header mismatch");
end

for i=1:length(startIdx1)
    out = dataOut(startIdx1(i):endIdx1(i), end-payloadBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedPayloadOut{i}, out, 5), "Payload mismatch");
end

assert(isequal(endIdx1(i), find(lastOut == true)), "last OFDM symbol and last frame signal should match");

%% Plotting
t = (0:1/fs:length(expectedHeaderOut{1})/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t, headerOut, t, expectedHeaderOut{1});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(headerOut - expectedHeaderOut{1}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

figure();
subplot(2,1,1)
plot(t, out, t, expectedPayloadOut{i});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedPayloadOut{i}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

disp("Test successfull!");



