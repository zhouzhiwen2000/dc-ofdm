%% Constants
% This file contains all constants that never change for the transmitter or
% receiver. Most of these values are fixated by the standard.
ldpc;

%% General
N = 256;                                % Number of subcarriers.
nullIdx = (1:11)';                      % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
numDataCarriers = N - length(nullIdx);  % Amount of subcarriers with actual data.

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


%% Modulator
fPHY = 50e6;                    % [Hz] Fixed by standard
oversamplingFactor = 2;
fs = fPHY*oversamplingFactor;   % [Hz] Sampling frequency, which will be the input of the DAC and ADC


%% Interpolator FIR filter
interpolatorFpass = 25e6;               % Passband frequency [Hz]
interpolatorFstop = 27.2e6;             % Stopband frequency [Hz]
interpolatorPassbandRippleDb = 0.1;     % Passband ripple [dB]
interpolatorStopbandAttDb = 60;         % Stopband attenuation [dB]

interpolatorSpec = fdesign.interpolator(oversamplingFactor, ...
    'lowpass','Fp,Fst,Ap,Ast', ...
    interpolatorFpass, ...
    interpolatorFstop, ...
    interpolatorPassbandRippleDb, ...
    interpolatorStopbandAttDb, ...
    fs);
interpolatorFilter = design(interpolatorSpec,'SystemObject',true);

% Group delay of the filter. delay = (nTaps - 1)/2
% The delay should be an integer, therefore, nTaps should be odd.
interpolatorDelay = mean(grpdelay(interpolatorFilter));     

% Uncomment to plot filter response
%fvtool(interpolatorFilter,'Fs', fs);

%% NCO (Numerical Controlled Oscillator)
% Wanting to obtain the following expression:
% sin(2*pi*n/(2*oversamplingFactor) + ncoPhaseOffset)

% How much the phase is increment each "n" sample
ncoPhaseStep = 1/(2*oversamplingFactor);

% The NCO will have a phase resolution of 1/2^ncoWordLength.
ncoWordLength = ceil(log2(2*oversamplingFactor)+1);

% The phase increment takes a value from [0; 2^ncoWordLength]
% A phase increment of "2^ncoWordLength" is equal to 2pi
ncoPhaseIncrement = 2^ncoWordLength*ncoPhaseStep;