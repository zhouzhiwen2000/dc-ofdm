%% Test OFDM CFO (Carrier Frequency Offset)
% Implementacion del algoritmo de Cox para sincronizar las frecuencias de 
% portadora de OFDM.
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
parameters;

%% Parameters
delay = 0; % Delay added to the signal
 % TODO, wrong value when frequency offset is added in the upshifter
 % Se cree que es porque aparece un desfase desde el transmisor, entonces
 % está mal asumir que los vectores temporales "n" son iguales.
 % Es decir, si el transmisor funciona con "cos(2*pi*(fc + deltaf)*t)", el
 % receptor debería funcionar con un "t'".
frequencyOffsetUpshifter = 0e3;
frequencyOffsetDownshifter = 4e3;

%% Header
hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(hGen);
hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(hLDPC);

%% Payload
pBits = logical(randi([0,1], payloadBitsPerBlock0, 1));
pScrambled = payloadScrambler(scramblerInitialization, pBits);
pLDPC = LDPCEncoder(pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
payloadOFDMSymbols = toneMapping(pLDPC, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

OFDMSignalDigital = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = interpolator(OFDMSignalDigital);
OFDMSignal = upshifter(OFDMSignal, frequencyOffsetUpshifter);


%% Channel
OFDMSignalDelayed = [zeros(2*delay, 1); OFDMSignal];
%OFDMSignalDelayed = awgn(OFDMSignalDelayed, 60);

%% Get complex signal, with frequency offset in the downshifter
OFDMRx = downshifter(OFDMSignalDelayed, frequencyOffsetDownshifter);
OFDMRx = decimator(OFDMRx);

%% Synchronize
[ofdmOut, delayOut, M, peaks, P] = ofdmSymbolSync(OFDMRx);

delayOut
plot(M)

frequencyOffset = ofdmCFO(P, delayOut)
