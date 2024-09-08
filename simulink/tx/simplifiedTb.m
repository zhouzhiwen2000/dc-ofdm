%% Transmitter, simplified testbench
% This file is meant to run a simplified test, to replicate in Vivado

clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = "sampleParametersFile";
msgIn = ['This is an example message used to test the transmitter. ' ...
    'It is made large on purpose to test for a large message being ' ...
    'transmitted'];

pWords = [];
validIn = [];
lastIn = [];

pBitsRaw = str2binl(msgIn);
pBitsRaw = getPayloadParamsFromBits(pBitsRaw);
pWords = [pWords binl2str(pBitsRaw)];
len = length(binl2str(pBitsRaw));
validIn = [validIn; true(len, 1);];
lastIn = [lastIn; false(len-1, 1); true;];

newFrame = true;

%% Expected Output
[reg0, reg1, reg2, reg3] = param2regs(paramFile, pBitsRaw);
[expectedOut, ~, payloadOFDMSymbols] = fullTx(paramFile, binl2tx(pBitsRaw), 0, false);
payloadOFDMSymbols = payloadOFDMSymbols(:);

%% Simulation Time
latency = 1000000/fs;             % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/(fs) + latency;

%% Run the simulation
model_name = "simplifiedTxTestbench";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx), 1), ...
    "Messages and start indexes should be the same number");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 0.01), "Outputs don't match");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test Successful!");

%% Create Vivado data file for VHDL testbench

% Generate input file
fileName = "data_in.mem";
input = {uint8(pWords');};
bitLen = 8;
header = "dataIn";
createVivadoDataFile(fileName, input, bitLen, header, ",");

% Generate output file
fileName = "data_out.mem";
fileOut = out*2^10;
input = {fileOut;};
bitLen = 12;
header = "dataOut";
createVivadoDataFile(fileName, input, bitLen, header, ",");