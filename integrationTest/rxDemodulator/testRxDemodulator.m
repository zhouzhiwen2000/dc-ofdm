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
parameters;

%% Transmitter pre-processing
hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(hGen);
hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(hLDPC);

pBits = logical(randi([0,1], payloadBitsPerBlock0, payloadLenInFecBlocks));
pLDPC = false(payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambled = payloadScrambler(scramblerInitialization, pBits(:,i));
    pLDPC(:,i) = LDPCEncoder(pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
end
pLDPC = pLDPC(:);
payloadOFDMSymbols = toneMapping(pLDPC, binl2dec(batId));

preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = interpolator(OFDMSignal);
OFDMSignal = upshifter(OFDMSignal);

%% Inputs
dataIn = OFDMSignal;
validIn = true(length(dataIn), 1);
psduSizeLSB = flip(psduSize);

%% ExpectedOutput
OFDMRx = downshifter(dataIn);
OFDMRx = decimator(OFDMRx);

preambleRx = OFDMRx(1:preambleOFDMSamples);
channelRx = OFDMRx(preambleOFDMSamples+1 : preambleOFDMSamples + channelOFDMSamples);
headerRx = OFDMRx(preambleOFDMSamples+channelOFDMSamples+1 : preambleOFDMSamples + channelOFDMSamples + headerOFDMSamples);
payloadRx = OFDMRx(preambleOFDMSamples + channelOFDMSamples + headerOFDMSamples + 1: end);

% Note, the preamble and channel symbols, in the real OFDM Demod, don't
% need to be calculated as LLR, but they are generated in this test 
% for simplicity ("true" argument)
preambleRxLLR = ofdmDemodulate(preambleRx, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit, true);
channelRxLLR = ofdmDemodulate(channelRx, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit, true);
headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true);
payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit, true);

for i=1:1:4
    expectedOut{i} = preambleRxLLR(1 + numDataCarriers*preambleBitsPerSubcarrier*(i+10-1) : numDataCarriers*preambleBitsPerSubcarrier*(i+10));
end

for i=1:1:2
    expectedOut1{i} = channelRxLLR(1 + numDataCarriers*channelBitsPerSubcarrier*(i-1): numDataCarriers*channelBitsPerSubcarrier*i);
end

expectedOut2{1} = headerRxLLR;

for i=1:1:payloadNumOFDMSymbols
    expectedOut3{i} = payloadRxLLR(1+numDataCarriers*payloadBitsPerSubcarrier*(i-1) : numDataCarriers*payloadBitsPerSubcarrier*i);
end

%% Simulation Time
latency = 30000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

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

startOut2 = get(simOut, "startOut2");
endOut2 = get(simOut, "endOut2");
validOut2 = get(simOut, "validOut2");

startOut3 = get(simOut, "startOut3");
endOut3 = get(simOut, "endOut3");
validOut3 = get(simOut, "validOut3");


lastOut = get(simOut, "lastOut");

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

startIdx2 = find(startOut2 == true);
endIdx2 = find(endOut2 == true);

startIdx3 = find(startOut3 == true);
endIdx3 = find(endOut3 == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx1), length(endIdx1)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx2), length(endIdx2)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx3), length(endIdx3)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");
assert(~isempty(startIdx1), "No start signal");
assert(~isempty(startIdx2), "No start signal");
assert(~isempty(startIdx3), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i), end-preambleBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut{i}, out, 1.5), "Output mismatch");
end

for i=1:length(startIdx1)
    out = dataOut(startIdx1(i):endIdx1(i), end-channelBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut1{i}, out, 1.5), "Output mismatch");
end

for i=1:length(startIdx2)
    out = dataOut(startIdx2(i):endIdx2(i), end-headerBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut2{i}, out, 1.5), "Output mismatch");
end

for i=1:length(startIdx3)
    out = dataOut(startIdx3(i):endIdx3(i), end-payloadBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut3{i}, out, 1.5), "Output mismatch");
end

assert(isequal(endIdx3(i), find(lastOut == true)), "last OFDM symbol and last frame signal should match");

%% Plotting
t = (0:1/fs:length(expectedOut3{i})/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t, out, t, expectedOut3{i});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedOut3{i}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

disp("Test successfull!");
