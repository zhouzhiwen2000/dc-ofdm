%% Test LDPC Encoder
clc; clear; close all;
addpath("../../src");
addpath("../../inc");

ldpc;

%% Inputs
dataBits = [];
validIn = [];
codeRate = [];
blockSize = [];
delay = false(10000,1);

R = logical([ ...
    0 0 1;
    0 0 1;
    0 1 0;
    0 1 0;
    0 1 1;
    0 1 1;
    ]);

K = logical([ ...
    0 0;
    0 1;
    0 0;
    0 1;
    0 0;
    0 1;
    ]);

for i=1:length(K)
    if (K(i,2) == false)
        sizeBits = 960;
    else
        sizeBits = 4320;
    end
    RMat = repmat(R(i,:), sizeBits+length(delay), 1);
    KMat = repmat(K(i,:), sizeBits+length(delay), 1);

    input{i} = logical(randi([0 1], sizeBits, 1));
    dataBits = [dataBits; input{i}; delay;];
    validIn = [validIn; true(sizeBits, 1); delay;];
    codeRate = [codeRate; RMat;];
    blockSize = [blockSize; KMat;];
end

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 5000;         % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLLDPCEncoder";

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

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = LDPCEncoder(input{i}, binl2dec(R(i,:)'), binl2dec(K(i,:)'), false);
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");
