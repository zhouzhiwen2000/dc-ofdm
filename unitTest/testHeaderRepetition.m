%% Test Header Repetition
clc; clear; close all;
addpath("../src");
addpath("../inc");
constants;

%% Test cases
% Size of the header after FEC encoding
input1 = false(headerBitsPerFec, 1);

input2 = logical([1 0 1 1 0 0 0 1 zeros(1, headerBitsPerFec-16) 1 1 1 0 1 1 0 0]);

input3 = logical([1 1 0 0 0 0 0 1 zeros(1, headerBitsPerFec-16) 1 1 1 0 1 1 1 0]);

%% Expected outputs
expectedOut1 = false(headerBitsPerOFDMSymbol, 1);
expectedOut2 = logical([input2 1 1 0 0 0 1 zeros(1, headerBitsPerOFDMSymbol - headerBitsPerFec - 6)])';
expectedOut3 = logical([input3 0 0 0 0 0 1 zeros(1, headerBitsPerOFDMSymbol - headerBitsPerFec - 6)])';

%% Perform tests
assert(isequal(expectedOut1, headerRepetitionEncoder(input1)));
assert(isequal(expectedOut2, headerRepetitionEncoder(input2)));
assert(isequal(expectedOut3, headerRepetitionEncoder(input3)));

disp("Test successful!");


%% Old test when the "headerBitsPerOFDMSymbol" was variable
% input4 = logical([1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0]);
% bits4 = Nfec*5 - 4;
% 
% expectedOut4 = logical([ ...
%     1 0 1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 ...
%     1 1 0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 ...
%     0 0 0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1 ...
%     0 1 zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1 0 0 ...
%     zeros(1, Nfec-16) 1 1 1 0 1 1 0 0 1 0 1 1])';
% 
% assert(isequal(expectedOut4, headerRepetitionEncoder(input4, bits4)));