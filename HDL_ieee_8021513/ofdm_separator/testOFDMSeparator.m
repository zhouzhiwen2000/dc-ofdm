%% Test OFDM Separator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;
parameters;

%% Header
hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(hGen);
hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(hLDPC);

%% Payload
pBits = logical(randi([0,1], payloadBitsPerBlock0, payloadLenInFecBlocks));
pLDPC = false(payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambled = payloadScrambler(scramblerInitialization, pBits(:,i));
    pLDPC(:,i) = LDPCEncoder(pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
end
pLDPC = pLDPC(:);
payloadOFDMSymbols = toneMapping(pLDPC, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

delayLen = 5000;

dataIn = [
    zeros(delayLen, 1); preambleTx; channelTx; headerTx; payloadTx; 
    zeros(delayLen, 1); preambleTx; channelTx; headerTx; payloadTx;
];

dataIn = awgn(dataIn, 60);

% The peak is detected in the first sample of the channel estimation
peakIn = [
    false(delayLen, 1);
    false(preambleOFDMSamples, 1); true;
    false(length(channelTx)-1, 1);
    false(length(headerTx), 1);
    false(length(payloadTx), 1);
    false(delayLen, 1);
    false(preambleOFDMSamples, 1); true;
    false(length(channelTx)-1, 1);
    false(length(headerTx), 1);
    false(length(payloadTx), 1);
];

psduSizeLSB = flip(psduSize);

%% Simulation Time
latency = 3000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(peakIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLOFDMSeparator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");

startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

startOut2 = get(simOut, "startOut2");
endOut2 = get(simOut, "endOut2");
validOut2 = get(simOut, "validOut2");

startOut3 = get(simOut, "startOut3");
endOut3 = get(simOut, "endOut3");
validOut3 = get(simOut, "validOut3");

%% Compare with MATLAB reference algorithm
startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

startIdx2 = find(startOut2 == true);
endIdx2 = find(endOut2 == true);

startIdx3 = find(startOut3 == true);
endIdx3 = find(endOut3 == true);

assert(isequal(length(startIdx1), length(endIdx1)));
assert(isequal(length(startIdx2), length(endIdx2)));
assert(isequal(length(startIdx3), length(endIdx3)));

for i=1:length(startIdx1)
    out = dataOut(startIdx1(i):endIdx1(i));
    expectedOut = channelTx;
    assert(iskindaequal(expectedOut, out, 10e-3));
end

for i=1:length(startIdx2)
    out = dataOut(startIdx2(i):endIdx2(i));
    expectedOut = headerTx;
    assert(iskindaequal(expectedOut, out, 10e-3));
end

for i=1:length(startIdx3)
    out = dataOut(startIdx3(i):endIdx3(i));
    expectedOut = payloadTx;
    assert(iskindaequal(expectedOut, out, 10e-3));
end

disp("Test Successful!");
