%% Parameters
% This file is the template for any "parameters" required for transmission
% of a PSDU.
%   The variable "pBits" needs to be defined before calling this file, 
%   which must contain the bits to be transferred in the payload.
constants;

%% Payload Parameters
[pBits, payloadLenInFecBlocks, payloadLenInBits, ...
    payloadLenInWords, payloadExtraWords] = getPayloadParamsFromBits(pBits);

%% Header formation
% Length of the payload, in octets
psduSize = dec2binl(payloadLenInWords, 24)';

% Amount of octets appended at the end of a payload, to make it a multiple 
% of "payloadBitsPerBlock0".
messageDuration = dec2binl(payloadExtraWords, 16)';

% The size of the FEC encoded keyword
% 0b00 = 960 bits or 0b01 = 4320 bits
% Only 0b00 is allowed.
blockSize = logical([0 0]);

% 0b001 = 1/2; 0b010 = 2/3; 0b011 = 5/6; 0b100 = 16/18; 0b101 = 20/21
% Only 0b001 is allowed.
fecRate = logical([0 0 1]);

% How many times the payload is repeated
% 0b001 = 1; 0b010 = 2; 0b011 = 3; 0b100 = 4; 0b101 = 6; 0b110 = 8
% This parameters is UNUSED.
repetitionNumber = logical([0 0 1]);

% UNUSED
fecConcatenationFactor = logical([0 0 0]);

% First four bits of the payload constellation scrambler
scramblerInitialization = logical([1 1 1 1]);

% batID determines the amount of bits allocated per subcarrier
batId = logical([0 0 0 1 0]);

% Number of samples for the cyclic prefix. Ncp = k* N /32. 3 bits max
cyclicPrefixId = logical([0 0 1]);

% MIMO not supported (UNUSED)
explicitMimoPilotSymbolCombSpacing = logical([0 0 0]);
explicitMimoPilotSymbolNumber = logical([0 0 0]);

%% Calculated parameters for the payload
payloadBitsPerSubcarrier = binl2dec(batId);
payloadCyclicPrefixLen = binl2dec(cyclicPrefixId) * N / 32;

payloadBitsPerOFDMSymbol = numDataCarriers*binl2dec(batId);

% Note: the "*2" is beacuse of the fec rate of 1/2.
payloadNumOFDMSymbols = ceil(double(binl2dec(psduSize)*axiWidth*2) / double(payloadBitsPerOFDMSymbol));
payloadNumOFDMSamples = (payloadCyclicPrefixLen + N)*payloadNumOFDMSymbols;
