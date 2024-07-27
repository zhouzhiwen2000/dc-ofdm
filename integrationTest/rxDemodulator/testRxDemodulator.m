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
    M(i) = preambleBitsPerSubcarrier;
end

for i=1:1:2
    expectedOut{4+i} = channelRxLLR(1 + numDataCarriers*channelBitsPerSubcarrier*(i-1): numDataCarriers*channelBitsPerSubcarrier*i);
    M(4+i) = channelBitsPerSubcarrier;
end

expectedOut{7} = headerRxLLR;
M(7) = headerBitsPerSubcarrier;

for i=1:1:payloadNumOFDMSymbols
    expectedOut{7+i} = payloadRxLLR(1+numDataCarriers*payloadBitsPerSubcarrier*(i-1) : numDataCarriers*payloadBitsPerSubcarrier*i);
    M(7+i) = payloadBitsPerSubcarrier;
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

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i), end-M(i)+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut{i}, out, 1.5), "Output mismatch");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
t = (0:1/fs:length(expectedOut{i})/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t, out, t, expectedOut{i});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedOut{i}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

disp("Test successfull!");
