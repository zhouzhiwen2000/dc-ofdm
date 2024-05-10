%% Test Constellation Scrambler
% Verify the constellation scrambler operation
clc; clear; close all;
addpath("../src");

%% Test Cases
input1 = true(16, 1);

input2 = true(8, 1);
%% Expected results
% Note: starting from the initialization, the first LFSR output is taken 2
% clock cycles after that, i.e.:
% 1 1 1 1 1 1 1 1 1 1 1 1 1     % Initialization
% 0 0 1 1 1 1 1 1 1 1 1 1 1     % 2 bit shift, first value
% 0 0 0 0 1 1 1 1 1 1 1 1 1     % 2 bit shift, second value
expectedOut1 = [1 1 1 1 -1i -1 -1 1 -1i -1i -1i 1 1 -1 -1 -1i].';

% Note: starting from the initialization, the first LFSR output is taken 2
% clock cycles after that, i.e.:
% 0 1 1 0 0 1 1 1 0 1 1 0 1     % Initialization
% 1 1 0 1 1 0 0 1 1 1 0 1 1     % 2 bit shift, first value
% 0 1 1 1 0 1 1 0 0 1 1 1 0     % 2 bit shift, second value
expectedOut2 = [-1i -1 1 -1i 1i -1 1i -1].';

%% Test 
assert(isequal(expectedOut1, constellationScrambler(input1, false)));
assert(isequal(expectedOut2, constellationScrambler(input2, true)));

disp("Test successfull!");
