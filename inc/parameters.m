%% Parameters
% These variables can change between PSDUs
constants;

%% Header formation
% All these variables are required to form the header. A more detailed
% explanation of each parameter can be found on the standard.

% Length of the payload, in octets
psduSize = 0;

% TODO: add the size of the payload, which should be inferred from the rest
% of the header values.
messageDuration = (preambleDuration + channelEstimationDuration + headerDuration); 

% The size of the FEC encoded keyword
% 0b00 = 960 bits or 0b01 = 4320 bits
blockSize = logical([0 0])';

% 0b001 = 1/2; 0b010 = 2/3; 0b011 = 5/6; 0b100 = 16/18; 0b101 = 20/21
fecRate = logical([0 0 1])';

% How many times the payload is repeated
% 0b001 = 1; 0b010 = 2; 0b011 = 3; 0b100 = 4; 0b101 = 6; 0b110 = 8
repetitionNumber = logical([0 0 1])';

fecConcatenationFactor = logical([0 0 0])'; % TODO

% First four bits of the payload constellation scrambler
scramblerInitialization = logical([1 1 1 1])';

% batID determines the amount of bits allocated per subcarrier
% (TODO, assign BAT ID values for different QAM modulations)
batId = logical([0 1 0 0 0])';

% Number of samples for the cyclic prefix. Ncp = k* N /32. 3 bits max
cyclicPrefixId = logical([0 0 0])';

% MIMO not supported
explicitMimoPilotSymbolCombSpacing = logical([0 0 0])';
explicitMimoPilotSymbolNumber = logical([0 0 0])';

