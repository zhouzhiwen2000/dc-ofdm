%% Test Constellation Scrambler
% Verify the constellation scrambler operation
clc; clear; close all;
addpath("../src");

%% Test Cases
input1 = true(17, 1);
init1 = logical([1 1 1 1 1 1 1 1 1 1 1 1 1]);

input2 = true(9, 1);
init2 = logical([0 1 1 0 0 1 1 1 0 1 1 0 1]);

%% Expected results
% Note: starting from the initialization, the first LFSR output is taken 2
% clock cycles after that, i.e.:
% 1 1 1 1 1 1 1 1 1 1 1 1 1     % Initialization, first value
% 0 0 1 1 1 1 1 1 1 1 1 1 1     % 2 bit shift, second value
% 0 0 0 0 1 1 1 1 1 1 1 1 1     % 2 bit shift, third value
expectedOut1 = [-1i 1 1 1 1 -1i -1 -1 1 -1i -1i -1i 1 1 -1 -1 -1i].';

% Note: starting from the initialization, the first LFSR output is taken 2
% clock cycles after that, i.e.:
% 0 1 1 0 0 1 1 1 0 1 1 0 1     % Initialization, first value
% 1 1 0 1 1 0 0 1 1 1 0 1 1     % 2 bit shift, second value
% 0 1 1 1 0 1 1 0 0 1 1 1 0     % 2 bit shift, third value
expectedOut2 = [-1 -1i -1 1 -1i 1i -1 1i -1].';

%% Test 
out1 = constellationScrambler(input1, init1);
out2 = constellationScrambler(input2, init2);
assert(isequal(expectedOut1, out1));
assert(isequal(expectedOut2, out2));

disp("Test successfull!");
