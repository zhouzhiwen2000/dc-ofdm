%% Test IEEE 802.15.13 full receiver
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
pWords = uint8(zeros(payloadWordsPerBlock0, payloadLenInFecBlocks));
for i=1:1:payloadLenInFecBlocks
    pBitsLSB = binl2tx(pBits(:,i));
    for j=1:1:payloadWordsPerBlock0
        pWords(j,i) = binl2dec(pBitsLSB(1+(j-1)*8:j*8));
    end
end
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

%% ExpectedOutput
[reg0, reg1, reg2, reg3] = param2regs("parameters.m");

%% Simulation Time
latency = 30000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLRx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

headerEndOut = get(simOut, "headerEndOut");
endOutIdx = find(headerEndOut==1);
endOutIdx = endOutIdx(1);

reg0Out = get(simOut, "reg0Out");
reg0Out = reg0Out(endOutIdx);

reg1Out = get(simOut, "reg1Out");
reg1Out = reg1Out(endOutIdx);

reg2Out = get(simOut, "reg2Out");
reg2Out = reg2Out(endOutIdx);

reg3Out = get(simOut, "reg3Out");
reg3Out = reg3Out(endOutIdx);

%% Compare with MATLAB reference algorithm

% Header was read correctly
assert(isequal(reg0Out, reg0));
assert(isequal(reg1Out, reg1));
assert(isequal(reg2Out, reg2));
assert(isequal(reg3Out, reg3));
disp("Header was read correctly!");

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");
assert(isequal(length(startIdx), payloadLenInFecBlocks), "Wrong number of payload bits read");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = pWords(:,i);
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
