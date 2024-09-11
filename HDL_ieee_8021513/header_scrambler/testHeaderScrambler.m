%% Test Header Scrambler
clc; clear; close all;
addpath("../../src/");
addpath("../../inc");
constants;

%% Inputs
input1 = true(32,1);

input2 = input1;

input3 = logical(randi([0 1], 256, 1));

validIn = [
    true(size(input1));
    false(2,1);
    true(size(input2));
    false(2,1);
    true(size(input3))];

dataBits = [
    input1;
    false(2,1);
    input2;
    false(2, 1);
    input3];

%% Simulation time
fs = 1;             % Output sample frequency
latency = 5;        % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLHeaderScrambler";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
validOut = get(simOut, "validOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");

%% Compare with MATLAB reference algorithm
expectedOut{1} = headerScrambler(CONST, input1);
expectedOut{2} = expectedOut{1};
expectedOut{3} = headerScrambler(CONST, input3);

startIdx = find(startOut == true);
endIdx = find(endOut == true);

% make sure that start and end have the same size
assert(isequal(length(startIdx), length(endIdx)));

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    
    % Data should match the scrambler
    assert(isequal(out, expectedOut{i}));
end

disp("Test successful!");
