%% Test Header Generate
% Ensure that the header is properly formed
% TODO proper test (with a known header and expected value
clc; clear; close all;
addpath("../src");

psduSize = 25;
messageDuration = 0.25e-6 * 99;
blockSize = logical([0 0])';
fecRate = logical([0 0 1])';
repetitionNumber = logical([0 0 1])';
fecConcatenationFactor = logical([0 0 0])';
scramblerInitialization = logical([0 0 0 0])';
batId = logical([0 0 0 0 0])';
cyclicPrefixId = logical([0 0 0])';
explicitMimoPilotSymbolCombSpacing = logical([0 0 0]);
explicitMimoPilotSymbolNumber = logical([0 0 0]);

headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
