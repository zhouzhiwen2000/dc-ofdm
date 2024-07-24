%% Test Rx Payload
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
payloadLenInFecBlocks = 3;
payloadLenInBits = payloadLenInFecBlocks*payloadBitsPerBlock0;
payloadLenInWords = payloadLenInBits/axiWidth;

psduSize = dec2binl(payloadLenInWords, 24)';
blockSize = logical([0 0]);
fecRate = logical([0 0 1]);
repetitionNumber = logical([0 0 1]);
scramblerInitialization = logical([1 1 1 1]);
batId = logical([0 0 0 1 0]);
cyclicPrefixId = logical([0 0 1]);

payloadBitsPerSubcarrier = binl2dec(batId);
payloadCyclicPrefixLen = binl2dec(cyclicPrefixId) * N / 32;

% Make LSB first parameters for the HDL block
scramblerInitLSB = flip(scramblerInitialization);
fecRateLSB = flip(fecRate);
blockSizeLSB = flip(blockSize);
batIdLSB = flip(batId);
psduSizeLSB = flip(psduSize);

% Generate input data
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
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);
payloadRxLLR = ofdmDemodulate(payloadTx, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit, true);

validIn = true(size(payloadRxLLR));
newFrame = true;

%% Simulation Time
latency = 20000/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(payloadRxLLR)-1)/(fPHY) + latency;

%% Run the simulation
model_name = "HDLRxPayload";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Test values
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx));

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = pWords(:,i);
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
