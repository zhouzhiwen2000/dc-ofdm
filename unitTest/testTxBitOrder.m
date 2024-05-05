%% Test Tx Bit Order
% This test ensures correct byte and bit order for transmisions
clc; clear; close all;
addpath("../src")

%% Test cases
input1 = logical([  0 1 0 1])';             % 4 bit

input2 = logical([  1 1 1 0 1 0 0])';       % 7 bit

input3 = logical([  1 0 0 1 1 1 0 1])';     % 8 bit

input4 = logical([  1 1 0 0 1 1 1 0 ...
                    0 0 1 0 0 1 1 0])';     % 16 bit

input5 = logical([  0 1 0 1 1 0 0 1 ...
                    0 0 0 0 0 1 0 0 ...
                    1 1 0 0 1 1 1 0])';     % 24 bit

input6 = logical([  1 1 0 1 0 1 1 1 ...
                    1 1 1 0 0 1 0 0 ...
                    0 0 1 0 1 0 0 1 ...
                    1 0 0 0 0 1 1 0])';     % 32 bit

input7 = logical([  0 0 0 1 0 1 1 0 ...
                    1 0])';                 % 10 bit

input8 = logical([  1 0 1 1 0 0 1 1 ...
                    1 1 1 0])';             % 12 bit

%% Expected results from tests
expected1 = logical([   1 0 1 0])';

expected2 = logical([   0 0 1 0 1 1 1])';

expected3 = logical([   1 0 1 1 1 0 0 1])';

expected4 = logical([   0 1 1 1 0 0 1 1 ...
                        0 1 1 0 0 1 0 0])';

expected5 = logical([   1 0 0 1 1 0 1 0 ...
                        0 0 1 0 0 0 0 0 ...
                        0 1 1 1 0 0 1 1])';

expected6 = logical([   1 1 1 0 1 0 1 1 ...
                        0 0 1 0 0 1 1 1 ...
                        1 0 0 1 0 1 0 0 ...
                        0 1 1 0 0 0 0 1])';

expected7 = logical([   0 1 1 0 1 0 0 0 ...
                        0 1])';

expected8 = logical([   1 1 0 0 1 1 0 1 ...
                        0 1 1 1])';

%% Perform tests
input1 = binl2dec(input1);
input2 = binl2dec(input2);
input3 = binl2dec(input3);
input4 = binl2dec(input4);
input5 = binl2dec(input5);
input6 = binl2dec(input6);
input7 = binl2dec(input7);
input8 = binl2dec(input8);

assert(isequal(expected1, dec2tx(input1, 4)));
assert(isequal(expected2, dec2tx(input2, 7)));
assert(isequal(expected3, dec2tx(input3)));
assert(isequal(expected4, dec2tx(input4)));
assert(isequal(expected5, dec2tx(input5, 24)));
assert(isequal(expected6, dec2tx(input6)));
assert(isequal(expected7, dec2tx(input7, 10)));
assert(isequal(expected8, dec2tx(input8)));

disp("Test successfull!");
