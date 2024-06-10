%% Constants
% This file contains all constants that never change for the transmitter or
% receiver. Most of these values are fixated by the standard.
ldpc;

%% General
N = 256;                                % Number of subcarriers.
nullIdx = (1:11)';                      % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
numDataCarriers = N - length(nullIdx);  % Amount of subcarriers with actual data.
oversamplingFactor = 2;

OFDMSymbolDuration = 5120e-9;           % OFDM Symbol duration [seconds]

%% Preamble
preambleScramblerInit = uint8([0 1 1 0 0 1 1 1 0 1 1 0 1]);     % 0x16E6 = 0b1011011100110, but LSB first 
preambleBitsPerSubcarrier = 1;
preambleCyclicPrefixLen = 0;
preambleOFDMSymbols = preambleGenerate(nullIdx);
preambleLUT = preambleOFDMSymbols(:);
preambleDuration = OFDMSymbolDuration*width(preambleOFDMSymbols);

%% Channel Estimation
channelScramblerInit = uint8([1 0 1 0 0 0 0 0 1 0 0 0 1]);      % 0x1105 = 0b1000100000101, but LSB first
channelBitsPerSubcarrier = 1;
channelCyclicPrefixLen = N/4; % 2.5 OFDM symbols for channel estimation means a quarter of cyclic prefix
channelOFDMSymbols = channelEstimationGenerate(nullIdx);
channelLUT = channelOFDMSymbols(:);
channelDuration = OFDMSymbolDuration*2.5;

%% Header
headerCRCPoly = logical([1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]);
headerScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
headerBitsPerSubcarrier = 2;  % BAT 1, 2 bits per subcarrier
headerCyclicPrefixLen = N/4;  % Fixed by standard
headerBitsPerFec = 336;
headerBitsPerOFDMSymbol = headerBitsPerSubcarrier*numDataCarriers;
headerDuration = OFDMSymbolDuration*1.25;

%% Payload
payloadBitsPerBlock0 = 960;
payloadBitsPerBlock1 = 4320;
axiWidth = 8;
payloadWordsPerBlock0 = payloadBitsPerBlock0/axiWidth;
payloadWordsPerBlock1 = payloadBitsPerBlock1/axiWidth;
payloadBitsPerFec = 1920;
payloadScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
% The rest of parameters of the payload are defined in the file
% "parameters"