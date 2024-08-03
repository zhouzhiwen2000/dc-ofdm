function [OFDMSignal] = fullTx(paramFile, pBits, carrierFrequencyOffset)
%FULLTX Run a full transmitter.
arguments(Input)
    paramFile string
    pBits (:, 1) logical
    carrierFrequencyOffset double = 0
end
arguments(Output)
    OFDMSignal (:,1) double
end
    constants;
    run(paramFile);
    
    %% Header
    hGen = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
        fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
        explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
    hScrambled = headerScrambler(hGen);
    hLDPC = LDPCEncoder(hScrambled, 0, 0, true);
    headerOFDMSymbols = headerRepetitionEncoder(hLDPC);
    
    %% Payload
    pBits = reshape(pBits, payloadBitsPerBlock0, payloadLenInFecBlocks);
    pLDPC = false(payloadBitsPerFec, payloadLenInFecBlocks);
    for i=1:1:payloadLenInFecBlocks
        pScrambled = payloadScrambler(scramblerInitialization, pBits(:,i));
        pLDPC(:,i) = LDPCEncoder(pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
    end
    pLDPC = pLDPC(:);
    payloadOFDMSymbols = toneMapping(pLDPC, binl2dec(batId));
    
    %% Transmiter
    preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
    channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
    headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
    payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);
    
    OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
    OFDMSignal = interpolator(OFDMSignal);
    OFDMSignal = upshifter(OFDMSignal, carrierFrequencyOffset);
end

