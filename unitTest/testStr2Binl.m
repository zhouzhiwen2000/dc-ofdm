%% Test Functions that convert string to binary representation
clc; clear; close all;
addpath("../src");

msg = 'hello world';
binaryMsg = logical([
    0 1 1 0 1 0 0 0;
    0 1 1 0 0 1 0 1;
    0 1 1 0 1 1 0 0;
    0 1 1 0 1 1 0 0;
    0 1 1 0 1 1 1 1;
    0 0 1 0 0 0 0 0;
    0 1 1 1 0 1 1 1;
    0 1 1 0 1 1 1 1;
    0 1 1 1 0 0 1 0;
    0 1 1 0 1 1 0 0;
    0 1 1 0 0 1 0 0;
])';
binaryMsg = binaryMsg(:);

binaryOut = str2binl(msg);
strOut = binl2str(binaryMsg);

assert(isequal(binaryMsg, binaryOut));
assert(isequal(msg, strOut));

disp("Test successfull");
