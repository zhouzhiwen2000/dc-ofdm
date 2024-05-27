%% Parameters file
% All header parameters must be logical row vectors

psduSize = logical([ ...
    0 1 0 1 0 1 0 1 ...
    0 0 1 1 1 0 0 0 ...
    1 0 1 0 1 0 1 0]);

messageDuration = logical([ ...
    0 0 1 1 0 0 1 1 ...
    1 1 0 1 1 0 0 0]);

blockSize = logical([0 1]);
fecRate = logical([0 0 1]);
repetitionNumber = logical([0 1 1]);
fecConcatenationFactor = logical([1 0 0]);
scramblerInitialization = logical([0 1 0 0]);
batId = logical([0 0 0 1 0]);
cyclicPrefixId = logical([1 0 0]);
explicitMimoPilotSymbolCombSpacing = logical([0 0 1]);
explicitMimoPilotSymbolNumber = logical([1 0 0]);
