%% Tx Rx: Test a communication between receiver and transmitter
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;
parameters;

%% Input

% Create databits, as a matrix with 8 columns (each row is a char), and
% then transform to chars.
if(payloadLenInFecBlocks ~= 0)
    dataBits = logical(randi([0 1], payloadLenInBits, 1));
    dataBitsMat = reshape(dataBits, axiWidth, payloadLenInWords)';
    dataIn = uint8(zeros(payloadLenInWords, 1));
    for i = 1:payloadLenInWords
        dataIn(i) = uint8(binl2dec(dataBitsMat(i,:)));
    end
    validIn = true(size(dataBits));
else
    validIn = false;
    dataBits = 0;
    dataIn = [0 0];
end

[reg0, reg1, reg2, reg3] = param2regs("parameters");
newFrame = logical([1; 0]);

%% Simulation Time
latency = 60000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLTxRx";

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

expectedOut = reshape(dataIn, payloadWordsPerBlock0, []);
for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut(:,i), out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");