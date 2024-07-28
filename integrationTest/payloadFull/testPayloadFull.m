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
simNormal = true;
simLarge = false;

if (simNormal == true)
    payloadLenInFecBlocks = 3;
    payloadLenInBits = payloadLenInFecBlocks*payloadBitsPerBlock0;
    payloadLenInWords = payloadLenInBits/axiWidth;
    disp("Running normal simulation");

elseif (simLarge == true)
    % Define the payload length with the amount of words
    payloadLenInWords = 2^16;
    payloadLenInBits = payloadLenInWords*axiWidth;
    payloadLenInFecBlocks = ceil(payloadLenInBits/payloadBitsPerBlock0);
    
    % The amount of bits and words should be a multiple of the fec block
    % size.
    payloadLenInBits = payloadLenInFecBlocks*payloadBitsPerBlock0;
    payloadLenInWords = payloadLenInBits/axiWidth;
    disp("Running large frame simulation");
else
    error("No simulation type selected");
end

% Create databits, as a matrix with 8 columns (each row is a char), and
% then transform to chars.
dataBits = logical(randi([0 1], payloadLenInBits, 1));
dataBitsMat = reshape(dataBits, axiWidth, payloadLenInWords)';
dataChars = uint8(zeros(payloadLenInWords, 1));
for i = 1:payloadLenInWords
    dataChars(i) = uint8(binl2dec(dataBitsMat(i,:)));
end

validIn = true(size(dataBits));

newFrame = logical([0; 0; 0; 0; 0; 1;]);

% All values for the parameters are LSB first
scramblerInit = logical([1 1 0 0]);
fecRate = logical([1 0 0]);
blockSize = logical([0 0]);
batId = logical([0 1 0 0 0]);
psduSize = flip(dec2binl(payloadLenInWords, 24))';
repNumber = logical([0 0 0]);

%% Simulation Time
latency = 1000000/fs;             % Algorithm latency. Delay between input and output
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
for i=1:payloadLenInFecBlocks
    p = payloadScrambler(scramblerInit, dataBitsLsb(1+(i-1)*payloadBitsPerBlock0:payloadBitsPerBlock0*i));
    p = LDPCEncoder(p, binl2dec(flip(fecRate)), binl2dec(flip(blockSize)), false);
    p = puncturing(p, binl2dec(flip(fecRate)), binl2dec(flip(blockSize)));
    p = payloadRepetitionEncoder(p, 1);
    expectedOut(:, i) = p;
end

expectedOut = toneMapping(expectedOut(:), binl2dec(flip(batId)));
expectedOut = expectedOut(:);

%% Actual test
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty");

out = dataOut(startIdx(1):endIdx(1));
valid = validOut(startIdx(1):endIdx(1));
out = out(valid == true);
assert(isequal(expectedOut, out));

disp("Test successfull!");