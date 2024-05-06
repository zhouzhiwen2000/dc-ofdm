%% Test Header Repetition
clc; clear; close all;
addpath("../src");

%% Test cases
% Size of the header after FEC encoding
Nfec = 336;

input1 = false(Nfec, 1);
bits1 = 500;

input2 = logical([1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0]);
bits2 = 472;

input3 = logical([1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0]);
bits3 = Nfec*2;

input4 = logical([1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0]);
bits4 = Nfec*5 - 4;

%% Expected outputs
expectedOut1 = false(500, 1);
expectedOut2 = logical([input2 1 1 0 0 0 1 zeros(1, 130)])';
expectedOut3 = logical([input3 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0])';
expectedOut4 = logical([ ...
    1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 ...
    1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 ...
    0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1 ...
    0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1 0 0 ...
    zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1])';


%% Perform tests
assert(isequal(expectedOut1, headerRepetitionEncoder(input1, bits1)));
assert(isequal(expectedOut2, headerRepetitionEncoder(input2, bits2)));
assert(isequal(expectedOut3, headerRepetitionEncoder(input3, bits3)));
assert(isequal(expectedOut4, headerRepetitionEncoder(input4, bits4)));

disp("Test successful!");
