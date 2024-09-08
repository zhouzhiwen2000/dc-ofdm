%% Constants
% This file contains all constants that never change for the transmitter or
% receiver. Most of these values are fixated by the standard.
ldpc;

%% General
N = 256;                                % Number of subcarriers.
leftGuard = (1:25)';
rightGuard = (220:256)';
nullIdx = [leftGuard; rightGuard];      % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
numDataCarriers = N - length(nullIdx);  % Amount of subcarriers with actual data.
if(numDataCarriers < 168)
    error("A minimum of 168 data carriers are needed to transmit the header in a single OFDM symbol!");
end

% This parameter is only used in the matlab reference algorithm. It adds
% zeroes only at the end of the transmission, to avoid a bug where the
% calculated delay might be more than the actual delay, and the ofdm
% demodulator fails for wrong size.
simTimeWindowInSamples = N/4;
OFDMSymbolDuration = 5120e-9;           % OFDM Symbol duration [seconds]

%% Preamble
preambleScramblerInit = uint8([0 1 1 0 0 1 1 1 0 1 1 0 1]);     % 0x16E6 = 0b1011011100110, but LSB first 
preambleBitsPerSubcarrier = 1;
preambleCyclicPrefixLen = 2;    % TODO if this values is "0", as it should be, the Simulink block breaks
preambleOFDMSymbols = preambleGenerate(nullIdx);
preambleLUT = preambleOFDMSymbols(:);
preambleDuration = OFDMSymbolDuration*width(preambleOFDMSymbols);
preambleDataCarriers = numDataCarriers*14;
preambleOFDMSamples = (N + preambleCyclicPrefixLen)*14;
preambleFirstPartOFDMSamples = (N + preambleCyclicPrefixLen)*10;
preambleSecondPartOFDMSamples = (N + preambleCyclicPrefixLen)*4;

%% Channel Estimation
channelScramblerInit = uint8([1 0 1 0 0 0 0 0 1 0 0 0 1]);      % 0x1105 = 0b1000100000101, but LSB first
channelBitsPerSubcarrier = 1;
channelCyclicPrefixLen = N/4; % 2.5 OFDM symbols for channel estimation means a quarter of cyclic prefix
channelOFDMSymbols = channelEstimationGenerate(nullIdx);
channelLUT = channelOFDMSymbols(:);
channelDuration = OFDMSymbolDuration*2.5;
channelDataCarriers = numDataCarriers*2;
channelOFDMSamples = (N + channelCyclicPrefixLen)*2;
channelEstReference = pskmod(channelOFDMSymbols(:,1), 2^channelBitsPerSubcarrier, PlotConstellation=false, InputType='bit');

%% Header
headerCRCPoly = logical([1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]);
headerScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
headerBitsPerSubcarrier = 2;  % BAT 1, 2 bits per subcarrier
headerCyclicPrefixLen = N/4;  % Fixed by standard
headerBitsPerFec = 336;
headerBitsPerOFDMSymbol = headerBitsPerSubcarrier*numDataCarriers;
headerDuration = OFDMSymbolDuration*1.25;
headerDataCarriers = numDataCarriers;
headerOFDMSamples = (N + headerCyclicPrefixLen)*1;

%% Payload
payloadBitsPerBlock0 = 960;
payloadBitsPerBlock1 = 4320;
axiWidth = 8;
payloadWordsPerBlock0 = payloadBitsPerBlock0/axiWidth;
payloadWordsPerBlock1 = payloadBitsPerBlock1/axiWidth;
payloadBitsPerFec = 1920;   % TODO: only valid if fec_rate = 1/2
payloadScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
% The rest of parameters of the payload are defined in the file
% "parameters"


%% Modulator
fPHY = 50e6;                    % [Hz] Fixed by standard
oversamplingFactor = 2;
fs = fPHY*oversamplingFactor;   % [Hz] Sampling frequency, which will be the input of the DAC and ADC


%% Tx Interpolator FIR filter
txL = 5;                                  % Upsampling factor for interpolator.
txInterpolatorFpass = 20e6;               % Passband frequency [Hz]
txInterpolatorFstop = 29e6;               % Stopband frequency [Hz]
txInterpolatorPassbandRippleDb = 0.1;     % Passband ripple [dB]
txInterpolatorStopbandAttDb = 80;         % Stopband attenuation [dB]

txInterpolatorSpec = fdesign.interpolator(txL, ...
    'lowpass','Fp,Fst,Ap,Ast', ...
    txInterpolatorFpass, ...
    txInterpolatorFstop, ...
    txInterpolatorPassbandRippleDb, ...
    txInterpolatorStopbandAttDb, ...
    fPHY*txL);
txInterpolatorFilter = design(txInterpolatorSpec,'SystemObject',true);
txInterpolatorDelay = mean(grpdelay(txInterpolatorFilter));
if (txInterpolatorDelay ~= round(txInterpolatorDelay))
    error("txInterpolatorDelay should be an integer!");
end

% Uncomment to plot filter response
%fvtool(txInterpolatorFilter,'Fs', fPHY*txL);

%% Tx Decimator FIR filter
txM = 2;                               % Decimator downsampling factor
txDecimatorFpass = 20e6;               % Passband frequency [Hz]
txDecimatorFstop = 24.8e6;               % Stopband frequency [Hz]
txDecimatorPassbandRippleDb = 0.1;     % Passband ripple [dB]
txDecimatorStopbandAttDb = 78;         % Stopband attenuation [dB]

txDecimatorSpec = fdesign.decimator(txM, 'lowpass', 'Fp,Fst,Ap,Ast', ...
    txDecimatorFpass, ...
    txDecimatorFstop, ...
    txDecimatorPassbandRippleDb, ...
    txDecimatorStopbandAttDb, ...
    fPHY*txL);
txDecimatorFilter = design(txDecimatorSpec, 'equiripple', 'SystemObject',true);

% Group delay of the filter should be even.
txDecimatorDelay = mean(grpdelay(txDecimatorFilter));
if (txDecimatorDelay ~= round(txDecimatorDelay))
    error("txDecimatorDelay should be an integer!");
elseif (mod(txDecimatorDelay, txM) ~= 0)
    error("txDecimatorDelay should be a multiple of txM!");
end

% Uncomment to plot filter response
%fvtool(txDecimatorFilter,'Fs', fPHY*txL);

fDAC = fPHY*txL/txM;
fADC = fDAC;

%% Upshifter NCO (Numerical Controlled Oscillator)
% These equations were taking from the "help" section of the NCO block.
ncoUpFrequencyResolution = 100;         % Frequency resolution for the NCO
ncoUpCarrierFrequency = fPHY/2;       % Carrier frequency of the NCO
ncoUpSFDR = 80;                       % Spurious free dynamic range [dB]

ncoUpWordLength = ceil(log2(fDAC/ncoUpFrequencyResolution));
ncoUpQuantization = ceil((ncoUpSFDR-12)/6);
ncoUpCarrierPhaseIncrement = round(ncoUpCarrierFrequency/fDAC*2^ncoUpWordLength);
ncoUpActualFreq = ncoUpCarrierPhaseIncrement*fDAC/(2^ncoUpWordLength);

%% Downshifter NCO
% These equations were taking from the "help" section of the NCO block.
ncoFrequencyResolution = 5;        % Frequency resolution for the NCO
ncoCarrierFrequency = fPHY/2;       % Carrier frequency of the NCO
ncoSFDR = 80;                       % Spurious free dynamic range [dB]

ncoWordLength = ceil(log2(fs/ncoFrequencyResolution));
ncoQuantization = ceil((ncoSFDR-12)/6);
ncoCarrierPhaseIncrement = round(ncoCarrierFrequency/fs*2^ncoWordLength);

%% Rx Interpolator FIR filter
rxL = 2;                                  % Upsampling factor for interpolator.
rxInterpolatorFpass = 20e6;               % Passband frequency [Hz]
rxInterpolatorFstop = 29e6;               % Stopband frequency [Hz]
rxInterpolatorPassbandRippleDb = 0.1;     % Passband ripple [dB]
rxInterpolatorStopbandAttDb = 80;         % Stopband attenuation [dB]

rxInterpolatorSpec = fdesign.interpolator(rxL, ...
    'lowpass','Fp,Fst,Ap,Ast', ...
    rxInterpolatorFpass, ...
    rxInterpolatorFstop, ...
    rxInterpolatorPassbandRippleDb, ...
    rxInterpolatorStopbandAttDb, ...
    fADC*rxL);
rxInterpolatorFilter = design(rxInterpolatorSpec,'SystemObject',true);
rxInterpolatorDelay = mean(grpdelay(rxInterpolatorFilter));
if (rxInterpolatorDelay ~= round(rxInterpolatorDelay))
    error("rxInterpolatorDelay should be an integer!");
end

% Uncomment to plot filter response
%fvtool(rxInterpolatorFilter,'Fs', fADC*rxL);

%% Decimator LPF filter
rxM = 5;
rxDecimatorFpass = 20e6;               % Passband frequency [Hz]
rxDecimatorFstop = 25e6;               % Stopband frequency [Hz]
rxDecimatorPassbandRippleDb = 0.1;     % Passband ripple [dB]
rxDecimatorStopbandAttDb = 81;         % Stopband attenuation [dB]
rxDecimatorStopbandAttDbForSim = 78;   % Used for simulation [dB]

rxDecimatorSpec = fdesign.decimator(rxM, 'lowpass', 'Fp,Fst,Ap,Ast', ...
    rxDecimatorFpass, ...
    rxDecimatorFstop, ...
    rxDecimatorPassbandRippleDb, ...
    rxDecimatorStopbandAttDb, ...
    fADC*rxL);
rxDecimatorFilter = design(rxDecimatorSpec, 'equiripple', 'SystemObject',true);

rxDecimatorSpecForSim = fdesign.decimator(rxM, 'lowpass', 'Fp,Fst,Ap,Ast', ...
    rxDecimatorFpass, ...
    rxDecimatorFstop, ...
    rxDecimatorPassbandRippleDb, ...
    rxDecimatorStopbandAttDbForSim, ...
    fADC*rxL);
rxDecimatorFilterForSim = design(rxDecimatorSpecForSim, 'equiripple', 'SystemObject',true);

% Group delay of the filter should be even.
rxDecimatorDelay = mean(grpdelay(rxDecimatorFilter));
if (rxDecimatorDelay == round(rxDecimatorDelay))
    error("rxDecimatorDelay should be fractional!");
elseif (mod(round(rxDecimatorDelay), rxM) ~= 3)
    error("rxDecimatorDelay should be mod(delay, rxM) == 1");
end

rxDecimatorDelayForSim = mean(grpdelay(rxDecimatorFilterForSim));
if (rxDecimatorDelayForSim ~= round(rxDecimatorDelayForSim))
    error("rxDecimatorDelayForSim should be an integer!");
elseif (mod(rxDecimatorDelayForSim, rxM) ~= 0)
    error("rxDecimatorDelayForSim should be multiple of rxM!");
end

% Uncomment to plot filter response
%fvtool(rxDecimatorFilter,'Fs', fADC);

%% QAM constellations
qamTwoBits = [3, 2, 1, 0];
qamFourBits = [2, 3, 1, 0, 6, 7, 5, 4, 14, 15, 13, 12, 10, 11, 9, 8];

%% Peak detector
peakDetectorWindow = 128;
peakDetectorThreshold = 0.65;
frequencyOffsetTimeWindow = preambleFirstPartOFDMSamples/fPHY;