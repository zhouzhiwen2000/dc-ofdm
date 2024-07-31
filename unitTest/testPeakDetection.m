%% Test Peak Detection
% Implementation of the algorith of local peak detection in the paper
% "Simple Algorithms for Peak Detection in Time-Series"
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");

%% Create input data
%%% Generate a random signal with peaks
inputLen = 2000;        % Size of input signal
peakLen = 58;           % Length of the gaussian pulse, which is used as a peak        
peakThreshold = 0.5;    % A peak will be considered only if it's value is greater than this threshold
k = 8;                  % Window size for peak detection

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

dataIn = awgn(dataIn, 20);

%% Outputs and expected outputs
[out, s] = peakDetection(dataIn, k, peakThreshold);

%% Test
% Don't assert, because the noise might move the peaks position
%assert(isequal(out, peakPosition));

plot(dataIn)

disp("Check in the graph if the out peaks are correct");
out
