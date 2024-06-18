%% Test Tone Mapper
clc; clear; close all;
addpath("../../src/")
addpath("../../inc/");
constants;

%% Inputs
delay = false(200, 1);

ofdmSymbols{1} = 1;
bitsPerSubcarrierX{1} = 1;
input{1} = true(numDataCarriers*ofdmSymbols{1}, 1);
expectedOut{1} = input{1};

ofdmSymbols{2} = 3;
bitsPerSubcarrierX{2} = 1;
input{2} = true(numDataCarriers*ofdmSymbols{2}, 1);
expectedOut{2} = input{2};

ofdmSymbols{3} = 1;
bitsPerSubcarrierX{3} = 1;
input{3} = true(numDataCarriers*ofdmSymbols{3} - 25, 1);
expectedOut{3} = [input{3}; false(25, 1)];

ofdmSymbols{4} = 4;
bitsPerSubcarrierX{4} = 2;
input{4} = true(numDataCarriers*ofdmSymbols{4}*bitsPerSubcarrierX{4} - 72, 1);
expectedOut{4} = [input{4}; false(72, 1);]; 

ofdmSymbols{5} = 3;
bitsPerSubcarrierX{5} = 4;
input{5} = true(numDataCarriers*ofdmSymbols{5}*bitsPerSubcarrierX{5} - 155, 1);
expectedOut{5} = [input{5}; false(155, 1);];

validIn = [
    true(size(input{1}));
    delay;
    true(size(input{2}));
    delay;
    true(size(input{3}));
    delay;
    true(size(input{4}));
    delay;
    true(size(input{5}));
    delay;
];

dataIn = [
    input{1};
    delay;
    input{2};
    delay;
    input{3};
    delay;
    input{4};
    delay;
    input{5};
    delay;
];

bitsPerSubcarrier = [
    repmat(bitsPerSubcarrierX{1}, size(expectedOut{1}));
    delay;
    repmat(bitsPerSubcarrierX{2}, size(expectedOut{2}));
    delay;
    repmat(bitsPerSubcarrierX{3}, size(expectedOut{3}));
    delay;
    repmat(bitsPerSubcarrierX{4}, size(expectedOut{4}));
    delay;
    repmat(bitsPerSubcarrierX{5}, size(expectedOut{5}));
    delay;
];

payloadLenInOFDMSymbols = [
    repmat(ofdmSymbols{1}, size(expectedOut{1}));
    delay;
    repmat(ofdmSymbols{2}, size(expectedOut{2}));
    delay;
    repmat(ofdmSymbols{3}, size(expectedOut{3}));
    delay;
    repmat(ofdmSymbols{4}, size(expectedOut{4}));
    delay;
    repmat(ofdmSymbols{5}, size(expectedOut{5}));
    delay;
];

%% Simulation time
fs = 1;             % Output sample frequency
latency = 1000;        % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLToneMapping";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
validOut = get(simOut, "validOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

% make sure that start and end have the same size
assert(isequal(length(startIdx), length(endIdx)), "Start and end indexes should be the same");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(out, expectedOut{i}));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0, "Valid is always active between Start and End signals");
end

disp("Simulation successful!");
