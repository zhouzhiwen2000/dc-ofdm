%% Test Peak Detection
% TODO: peak detector HDL is not working correctly

clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Create input data
%%% Generate a random signal with peaks
inputLen = 2000;        % Size of input signal
peakLen = 58;           % Length of the gaussian pulse, which is used as a peak        

% Location of peaks in the input data
peakPosition = [200 600 1500]';

%%% Signal generation
dataIn = zeros(inputLen, 1);
peak = (peakLen/3*gaussdesign(1,1,peakLen)).';

for i=1:1:length(peakPosition)
    dataIn(peakPosition(i)-peakLen/2 : peakPosition(i) + peakLen/2) = ...
        dataIn(peakPosition(i)-peakLen/2 : peakPosition(i) + peakLen/2) + peak;
end

%%% Add some false peaks
falsePeakPosition = randi([peakLen/2+1, length(dataIn)-peakLen/2], 30, 1);
falsePeak = peak/3;

for i=1:1:length(falsePeakPosition)
    dataIn(falsePeakPosition(i)-peakLen/2 : falsePeakPosition(i) + peakLen/2) = ...
        dataIn(falsePeakPosition(i)-peakLen/2 : falsePeakPosition(i) + peakLen/2) + falsePeak;
end

dataIn = awgn(dataIn, 40);

expectedOut = peakDetection(dataIn, peakDetectorWindow, peakDetectorThreshold);

%% Simulation Time
latency = 300/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLPeakDetector";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
counter = get(simOut, "counter");

%% Compare with MATLAB reference algorithm
indexes = find(dataOut ~= 0);
indexes = counter(indexes);

assert(isequal(indexes, expectedOut));

plot(dataIn);

disp("Test Successfull!");

% for i=1:length(startIdx)
%     out = dataOut(startIdx(i):endIdx(i));
%     assert(iskindaequal(expectedOut, out, 5e-3));
%     assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
% end

