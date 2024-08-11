%% Parameters file
% All header parameters must be logical row vectors

psduSize = logical([ ...
    0 1 1 1 0 1 0 1 ...
    0 0 0 1 1 0 0 0 ...
    0 0 1 1 1 0 1 0]);

messageDuration = logical([ ...
    0 0 0 1 0 0 1 1 ...
    0 1 0 1 0 0 0 0]);

blockSize = logical([1 0]);
fecRate = logical([0 1 0]);
repetitionNumber = logical([1 0 1]);
fecConcatenationFactor = logical([1 1 0]);
scramblerInitialization = logical([0 1 1 1]);
batId = logical([1 1 0 1 0]);
cyclicPrefixId = logical([1 0 0]);
explicitMimoPilotSymbolCombSpacing = logical([1 0 0]);
explicitMimoPilotSymbolNumber = logical([0 1 1]);