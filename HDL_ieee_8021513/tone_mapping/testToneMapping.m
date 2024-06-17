%% Test Tone Mapper
clc; clear; close all;
addpath("../../src/")
addpath("../../inc/");
constants;

%% Inputs
delay = false(100, 1);

input{1} = true(numDataCarriers, 1);
bitsPerSubcarrier{1} = 1;
expectedOut{1} = input{1};

input{2} = true(numDataCarriers*3, 1);
bitsPerSubcarrier{2} = 1;
expectedOut{2} = input{2};

input{3} = true(numDataCarriers*4-25, 1);
bitsPerSubcarrier{3} = 1;
expectedOut{3} = [input{3}; false(25, 1)];

input{4} = true(numDataCarriers*2 - 9, 1);
bitsPerSubcarrier{4} = 2;
expectedOut{4} = [input{4}; false(9*4, 1);]; 

input{5} = true(numDataCarriers*4 - 7, 1);
bitsPerSubcarrier{5} = 4;
expectedOut{5} = [input{5}; false(7*4, 1);];

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
    disp(i)
end

disp("Simulation successful!");
