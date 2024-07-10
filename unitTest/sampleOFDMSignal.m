%% Generate a sample OFDM Signal, used for other tests
addpath("../src");
addpath("../inc")
constants;
parameters;

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
OFDMSignal = upshifter(OFDMSignal);