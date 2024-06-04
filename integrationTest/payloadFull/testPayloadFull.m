%% Test payload full implementation, with:
% - Payload generation from registers.
% - Input data simulating an AXI4 Stream FIFO, with TVALID and TREADY
% signals.
% - Payload scrambler.
% - Payload LDPC encoder.
% - Payload Puncturer (not supported).
% - Payload repetition (not supported).
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
% Define payload length
payloadLenInFecBlocks = 3;
payloadLenInBits = payloadLenInFecBlocks*payloadBitsPerBlock0;
payloadLenInWords = payloadLenInBits/axiWidth;

% Create databits, as a matrix with 8 columns (each row is a char), and
% then transform to chars.
dataBits = logical(randi([0 1], payloadLenInBits, 1));
dataBitsMat = reshape(dataBits, axiWidth, payloadLenInWords)';
dataChars = uint8(zeros(payloadLenInWords, 1));
for i = 1:payloadLenInWords
    dataChars(i) = uint8(binl2dec(dataBitsMat(i,:)));
end

validIn = true(size(dataBits));

% All values for the parameters are LSB first
scramblerInit = logical([1 1 0 0]);
fecRate = logical([1 0 0]);
blockSize = logical([0 0]);

%% Simulation Time
fs = 1;                     % Output sample frequency
latency = 10000;             % Algorithm latency. Delay between input and output
stopTime = (length(dataChars)-1)/(fs) + latency;

%% Run the simulation
model_name = "HDLPayloadFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
dataBitsLsb = binl2tx(dataBits);
expectedOut = false(payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:payloadLenInFecBlocks
    p = payloadScrambler(scramblerInit, dataBitsLsb(1+(i-1)*payloadBitsPerBlock0:payloadBitsPerBlock0*i));
    p = LDPCEncoder(p, binl2dec(flip(fecRate)), binl2dec(flip(blockSize)), false);
    p = puncturing(p, binl2dec(flip(fecRate)), binl2dec(flip(blockSize)));
    p = payloadRepetitionEncoder(p, 1);
    expectedOut(:, i) = p;
end

%% Actual test
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:payloadLenInFecBlocks
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut(:,i), out));
end

disp("Test successfull!");