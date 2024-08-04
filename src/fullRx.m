function [pBitsRx, err, delay, frequencyOffset, channelEst, ...
    psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, ...
    explicitMimoPilotSymbolNumberRx] = fullRx(OFDMSignal, carrierFrequencyOffset)
%FULLRX Full Rx implementation. Returns the payload bits, and the header
% parameters. If "err == 1", then the header was read with some errors.
arguments(Input)
    OFDMSignal (:, 1) double
    carrierFrequencyOffset double = 0
end
arguments(Output)
    pBitsRx (:, 1) logical
    err logical
    delay double
    frequencyOffset double
    channelEst double
    psduSizeRx (24, 1) logical
    messageDurationRx (16, 1) logical
    blockSizeRx (2, 1) logical
    fecRateRx (3, 1) logical
    repetitionNumberRx (3, 1) logical
    fecConcatenationFactorRx (3, 1) logical
    scramblerInitializationRx (4, 1) logical
    batIdRx (5,1) logical
    cyclicPrefixIdRx (3, 1) logical
    explicitMimoPilotSymbolCombSpacingRx (3, 1) logical
    explicitMimoPilotSymbolNumberRx (3, 1) logical
end
    constants;

    %% Prepare OFDM samples to be demodulated
    OFDMRxRaw = downshifter(OFDMSignal, carrierFrequencyOffset);
    OFDMRxRaw = decimator(OFDMRxRaw);

    [~, delay, ~, ~, frequencyOffset] = ofdmSymbolSync(OFDMRxRaw);

    %% Correct CFO
    OFDMRx = OFDMSignal(1 + delay*2 + preambleOFDMSamples*2:end);
    OFDMRx = downshifter(OFDMRx, carrierFrequencyOffset +frequencyOffset);
    OFDMRx = decimator(OFDMRx);

    %% Estimate channel
    [OFDMRx, channelEst] = ofdmChannelEstimation(OFDMRx);

    %% Process header
    headerRx = OFDMRx(1:headerOFDMSamples);
    headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit, true, channelEst);
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
        warning("Header was not read correctly");
    end
    
    %% Process payload
    % Remove the excess timingWindow added and the header samples
    payloadRx = OFDMRx(1+headerOFDMSamples:end);
    excessPayloadSamples = mod(length(payloadRx),N+payloadCyclicPrefixLenRx);
    payloadRx = payloadRx(1:end-excessPayloadSamples);

    if (isempty(payloadRx))
        pBitsRx = [];
        return
    end

    payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrierRx, payloadCyclicPrefixLenRx, nullIdx, payloadScramblerInit, true, channelEst);
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

