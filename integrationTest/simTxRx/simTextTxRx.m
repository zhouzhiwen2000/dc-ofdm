%% Test transmission and reception of text
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

parametersFile = "parameters.m";
msg = 'hello world';
pBits = str2binl(msg);

OFDMSignal = fullTx(parametersFile, pBits);
pBitsRx = fullRx(OFDMSignal);

msgRx = binl2str(pBitsRx);
assert(isequal(msg, msgRx));

disp("Test Successfull!");
