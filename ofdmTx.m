%% IEEE 802.15.13 Transmitter
% Full implementation of the PHY of the IEEE 802.15.13-2023 standard.
clc; clear; close all;
addpath("src");

%% General constants
N = 256;            % Number of subcarriers.
nullIdx = (1:11)';  % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
numDataCarriers = N - length(nullIdx);  % Amount of subcarriers with actual data

%% Preamble
% 0x16E6 = 0b1011011100110, but LSB first
preambleScramblerInit = uint8([0 1 1 0 0 1 1 1 0 1 1 0 1]);

preamble = preambleGenerate(nullIdx);
ofdmModulate(preamble, 2, 0, nullIdx, preambleScramblerInit);

%% Channel Estimation
% 0x1105 = 0b1000100000101, but LSB first
channelScramblerInit = uint8([1 0 1 0 0 0 0 0 1 0 0 0 1]);
cpLenChannel = N/4; % 2.5 OFDM symbols for channel estimation means a quarter of cyclic prefix

channelEstimation = channelEstimationGenerate(nullIdx);
ofdmModulate(channelEstimation, 2, cpLenChannel, nullIdx, channelScramblerInit);

%% Header
MHeader = 4;  % BAT 1, 2 bits per subcarrier
headerScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
cpLenHeader = N/4;  % Fixed by standard

header = true(168, 1);          % TODO header generate
ha = headerScrambler(header);
hb = LDPCEncoder(ha, 0, 0, true);
hc = puncturing(hb, 1, 0);
bitsPerOFDMSymbolHeader = log2(MHeader)*numDataCarriers;
hd = headerRepetitionEncoder(hc, bitsPerOFDMSymbolHeader);
ofdmModulate(hd, MHeader, cpLenHeader, nullIdx, headerScramblerInit);

%% Payload
scramblerInit = [1 1 1 1];  % Scrambler for payload

payload = true(960, 1);
pa = payloadScrambler(scramblerInit, payload);
pb = LDPCEncoder(pa, codeRate, blockSize, false);
pc = puncturing(pb, codeRate, blockSize);
pd = payloadRepetitionEncoder(pc, 1);

% TODO tone mapping
% TODO ofdmModulate


%% Transmiter
% Quiero tener todos los datos almacenados en una RAM, e ir sacando de a un
% símbolo OFDM a la vez. El preámbulo, el header y el payload tienen
% distintos valores de CP, modulación QAM, etc.









