%% Test Modulator full implementation with:
% - Input data simulating a RAM with a full frame, formatted with 12 bits 
% per symbol (no matter the actual QAM modulation order).
% - Tone mapping.
% - QAM modulation.
% - Constellation scrambler.
% - OFDM modulator.
% - Frequency up-shift.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;
parameters;

%% Transmitter pre-processing
h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(h);
h = LDPCEncoder(h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(h);

p = logical(randi([0,1], payloadBitsPerBlock0, 1));
p = payloadScrambler(scramblerInitialization, p);
p = LDPCEncoder(p, binl2dec(fecRate), binl2dec(blockSize), false);
p = puncturing(p, binl2dec(fecRate), binl2dec(blockSize));
p = payloadRepetitionEncoder(p, binl2dec(repetitionNumber));
payloadOFDMSymbols = toneMapping(p, binl2dec(batId));

%% Expected Output
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = interpolator(OFDMSignal);
expectedOut = upshifter(OFDMSignal);

%% Inputs

% Raw bits to words for the header
hx = headerOFDMSymbols(:);
h = zeros(length(hx)/headerBitsPerSubcarrier, 1);
for i=1:headerBitsPerSubcarrier:length(hx)-1
    h(floor(i/headerBitsPerSubcarrier)+1) = binl2dec(hx(i:i+headerBitsPerSubcarrier-1));
end

% Raw bits to wrodds for the payload
px = payloadOFDMSymbols(:);
p = zeros(length(payloadOFDMSymbols(:))/payloadBitsPerSubcarrier, 1);
for i=1:payloadBitsPerSubcarrier:length(px)-1
    p(floor(i/payloadBitsPerSubcarrier)+1) = binl2dec(px(i:i+payloadBitsPerSubcarrier-1));
end

dataSymbols = [
    preambleOFDMSymbols(:);
    channelOFDMSymbols(:);
    h(:);
    p(:);
];

bitsPerSubcarrier = [
    repmat(preambleBitsPerSubcarrier, length(preambleOFDMSymbols(:)), 1);
    repmat(channelBitsPerSubcarrier, length(channelOFDMSymbols(:)), 1);
    repmat(headerBitsPerSubcarrier, length(headerOFDMSymbols(:))/headerBitsPerSubcarrier, 1);
    repmat(payloadBitsPerSubcarrier, length(payloadOFDMSymbols(:)), 1);

];

init = [
    repmat(preambleScramblerInit, length(preambleOFDMSymbols(:)), 1);
    repmat(channelScramblerInit, length(channelOFDMSymbols(:)), 1);
    repmat(headerScramblerInit, length(headerOFDMSymbols(:))/headerBitsPerSubcarrier, 1);
    repmat(payloadScramblerInit, length(payloadOFDMSymbols(:)), 1);
];

cpLen = [
    repmat(preambleCyclicPrefixLen, length(preambleOFDMSymbols(:)), 1);
    repmat(channelCyclicPrefixLen, length(channelOFDMSymbols(:)), 1);
    repmat(headerCyclicPrefixLen, length(headerOFDMSymbols(:))/headerBitsPerSubcarrier, 1);
    repmat(payloadCyclicPrefixLen, length(payloadOFDMSymbols(:)), 1);
];

validIn = true(length(dataSymbols), 1);

%% Simulation Time
latency = 30000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLModulatorFull";

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

assert(~isempty(startIdx), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 1), "Output mismatch");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
t = (0:1/fs:length(expectedOut)/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t, out, t, expectedOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedOut));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

figure();
resampledOut = resample(out, 2, 1);
[psd, fVector] = pwelch(resampledOut, rectwin(length(resampledOut)), [], 2^16, 2*fs, "centered");
plot(fVector/1e6, 10*log10(psd));
title("PSD of the transmitted signal")
xlabel("Freq. [MHz]");
ylabel("PSD [dB/Hz]");
grid on;

disp("Test successfull!");
