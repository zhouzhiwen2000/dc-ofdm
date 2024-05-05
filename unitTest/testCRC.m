%% Test CRC
% This test ensures correct functionality of the CRC algorithm
clc; clear; close all;
addpath("../src")

%% Test cases
inputMsg = logical([1 0 0 1 0 0])';
inputPoly = logical([1 1 0 1]);

%% Expected results
expectedCRC = logical([1 0 0])';
expectedMsgGenerated = logical([1 0 0 1 0 0 1 0 0])';

%% Perform tests
[msgGenerated, crc] = crcGenerate(inputPoly, inputMsg);
[msgReceived, err] = crcDecode(inputPoly, msgGenerated);

assert(isequal(msgGenerated, expectedMsgGenerated));
assert(isequal(expectedCRC, crc));
assert(isequal(inputMsg, msgReceived));
assert(isequal(err, false));

disp("Test successfull!");
