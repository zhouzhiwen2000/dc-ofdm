%% Test Constellation Scrambler
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
delay = zeros(100,13);

scramblerInit = [
    true(100, 13);
    delay;
    true(100,13);
    %repmat(preambleScramblerInit, 100, 1);
    delay;
    repmat(channelScramblerInit, 100, 1);
    delay;
    repmat(headerScramblerInit, 100, 1);
    delay;
    repmat(payloadScramblerInit, 100, 1);
    delay;
];

dataSymbols = [
    ones(100, 1);
    ones(100,1);
    randi([0 255], length(scramblerInit)-100, 1) + 1i*randi([0 255], length(scramblerInit)-100, 1);
    ];

validIn = [
    true(100, 1);
    false(100, 1);
    true(100, 1);
    false(100,1);
    true(100, 1);
    false(100, 1);
    true(100, 1);
    false(100, 1);
    true(100, 1);
    false(100, 1)];

%% Simulation Time
latency = 300/fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fPHY + latency;

%% Run the simulation
model_name = "HDLConstellationScrambler";

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
    data = dataSymbols(1+(i-1)*100:i*100);
    expectedOut = constellationScrambler(data, scramblerInit(1+(i-1)*200,:));
    assert(isequal(expectedOut, out));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

disp("Test successfull!");
