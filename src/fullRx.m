function [pBitsRx, err, psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, ...
    explicitMimoPilotSymbolNumberRx] = fullRx(OFDMSignal)
%FULLRX Full Rx implementation
    constants;

    %% Separate Preamble, Channel and Header
    % Payload can't be processed until the header was obtained (I need to know
    % the cyclic prefix used for the payload)
    OFDMRx = downshifter(OFDMSignal);
    OFDMRx = decimator(OFDMRx);

    %% Detect delay
    [OFDMRx, delay] = ofdmSymbolSync(OFDMRx);
    fprintf("Delay found: %d\n", delay);
    
    preambleRx = OFDMRx(1:preambleOFDMSamples);
    channelRx = OFDMRx(preambleOFDMSamples+1 : ...
        preambleOFDMSamples + channelOFDMSamples);
    headerRx = OFDMRx(preambleOFDMSamples+channelOFDMSamples+1 : ...
        preambleOFDMSamples + channelOFDMSamples + headerOFDMSamples);
    payloadRx = OFDMRx(preambleOFDMSamples + channelOFDMSamples + headerOFDMSamples + 1: end);
    
    preambleRxBits = ofdmDemodulate(preambleRx, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit, false);
    channelRxBits = ofdmDemodulate(channelRx, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit, false);
    headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true);
    
    %% Process header
    % The header uses LLR, not bits.
    hRxLLR = headerRemoveRepetition(headerRxLLR);
    hScrambledRx = LDPCDecoder(hRxLLR, 0, 0, true);
    hGenRx = headerScrambler(hScrambledRx);
    [err, psduSizeRx, messageDurationRx, blockSizeRx, ...
        fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
        scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
        explicitMimoPilotSymbolCombSpacingRx, ...
        explicitMimoPilotSymbolNumberRx] = headerSeparate(hGenRx);
    
    %% Estimate payload parameters from header
    payloadBitsPerSubcarrierRx = binl2dec(batIdRx);
    payloadCyclicPrefixLenRx = binl2dec(cyclicPrefixIdRx) * N / 32;

    if (err == true)
        error("Header was not read correctly");
    end
    
    %% Process payload
    payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrierRx, payloadCyclicPrefixLenRx, nullIdx, payloadScramblerInit, true);
    pRxLLR = removeToneMapping(payloadRxLLR, psduSizeRx);

    % Knowing the full size of the signal, reshape it to fit in the LDPC
    % decoder
    pRxLLR = reshape(pRxLLR, payloadBitsPerFec, []);
    payloadLenInFecBlocks = width(pRxLLR);
    
    pBitsRx = false(payloadBitsPerBlock0, payloadLenInFecBlocks);
    for i=1:1:payloadLenInFecBlocks
        pScrambledRx = LDPCDecoder(pRxLLR(:,i), binl2dec(fecRateRx), binl2dec(blockSizeRx), false);
        pBitsRx(:,i) = payloadScrambler(scramblerInitializationRx, pScrambledRx);
    end
    pBitsRx = pBitsRx(:);

    % Remove excess bits, which were added to make the message be a
    % multiple of the fecBlockSize.
    payloadBitsExtra = binl2dec(messageDurationRx)*8;
    pBitsRx = pBitsRx(1:end-payloadBitsExtra, 1);
end

