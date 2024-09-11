%% Test Header CRC
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
psduSize = logical([ ...
    0 1 0 1 0 1 0 1 ...
    0 0 1 1 1 0 0 0 ...
    1 0 1 0 1 0 1 0]);

messageDuration = logical([ ...
    0 0 1 1 0 0 1 1 ...
    1 1 0 1 1 0 0 0]);

blockSize = logical([0 1])';
fecRate = logical([0 0 1])';
repetitionNumber = logical([0 1 1])';
fecConcatenationFactor = logical([1 0 0])';
scramblerInitialization = logical([0 1 0 0])';
batId = logical([0 0 0 1 0])';
cyclicPrefixId = logical([1 0 0])';
explicitMimoPilotSymbolCombSpacing = logical([0 0 1])';
explicitMimoPilotSymbolNumber = logical([1 0 0])';

input = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);

input = input(1:end-16); % Remove CRC

dataBits = [input; false(300, 1); input;];

validIn = [true(size(input)); false(300,1); true(size(input));];

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 300;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLHeaderCRC";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
expectedOut = logical([ ...
    0 0 1 1 ...         % Frame Type
    0 0 0 0 ...         % Frame subtype
    0 1 0 1 0 1 0 1 ... % PSDU size 0-7
    0 0 0 1 1 1 0 0 ... % PSDU size 8-15
    1 0 1 0 1 0 1 0 ... % PSDU size 16-23
    0 0 0 1 1 0 1 1 ... % Message duration 0-7
    1 1 0 0 1 1 0 0 ... % Message duration 8-15
    1 0 ...             % Block Size
    1 0 0 ...           % fecRate
    1 1 0 ...           % Repetition number
    0 0 1 ...           % fecConcatenationFactor
    0 0 1 0 ...         % Scramber Init
    0 ...               % Reserved 63
    0 1 0 0 0 ...       % BAT ID
    0 0 0 ...           % Reserved 69-71
    0 0 1 ...           % Cyclic Prefix ID
    1 0 0 ...           % Explicit MIMO Comb Spacing
    0 0 0 0 0 0 0 0 ... % Reserved 78-85
    0 0 0 0 0 0 0 0 ... % Reserved 86-93
    0 0 0 0 0 0 0 0 ... % Reserved 94-101
    0 0 0 0 ...         % Reserved 102-105
    0 0 1 ...           % Explicit MIMO Symbol Number
    0 0 0 0 0 0 0 0 ... % Reserved 109-116
    0 0 0 0 0 0 0 0 ... % Reserved 117-124
    0 0 0 0 0 0 0 0 ... % Reserved 125-132
    0 0 0 0 0 0 0 0 ... % Reserved 133-140
    0 0 0 0 0 0 0 0 ... % Reserved 141-148
    0 0 0])';           % Reserved 149-151

expectedOut = crcGenerate(CONST.headerCRCPoly, expectedOut);

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty")
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");

